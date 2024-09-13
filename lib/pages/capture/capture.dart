import 'package:camera/camera.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:flutter/material.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  bool isLoaded = false;

  CameraController? controller;
  XFile? imageFile;
  FlashMode flashMode = FlashMode.off;

  bool loaded = false;
  bool error = false;
  bool capturing = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    (() async {
      _cameras = await availableCameras();
      if (_cameras.length < 2) {
        error = true;
      } else {
        await onNewCameraSelected(_cameras.firstWhere(
            (CameraDescription camera) =>
                camera.lensDirection == CameraLensDirection.back));
      }
      setState(() {
        loaded = true;
      });
    })();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Picture'),
      ),
      body: (!loaded)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 3 / 4,
                                      child: CameraPreview(
                                        controller!,
                                      ),
                                    ),
                                  )),
                              if (capturing)
                                const Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            ],
                          ),
                          if (!capturing)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: Icon({
                                    FlashMode.off: Icons.flash_off,
                                    FlashMode.always: Icons.flash_on,
                                    FlashMode.auto: Icons.flash_auto,
                                    FlashMode.torch: Icons.flash_on,
                                  }[flashMode]),
                                  onPressed: () {
                                    const modes = [
                                      FlashMode.off,
                                      FlashMode.always,
                                      FlashMode.auto,
                                      FlashMode.torch,
                                    ];
                                    setFlashMode(modes[
                                        (modes.indexOf(flashMode) + 1) %
                                            modes.length]);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.camera),
                                  onPressed: onTakePictureButtonPressed,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.switch_camera),
                                  onPressed: () async {
                                    await switchCamera();
                                  },
                                ),
                              ],
                            ),
                        ],
                      )),
                ),
              ],
            ),
    );
  }

  Future<void> switchCamera() async {
    final CameraDescription newCamera = _cameras.firstWhere(
        (CameraDescription camera) =>
            camera.lensDirection != controller!.description.lensDirection);
    await onNewCameraSelected(newCamera);
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      return controller!.setDescription(cameraDescription);
    } else {
      return _initializeCameraController(cameraDescription);
    }
  }

  Future<void> _initializeCameraController(
      CameraDescription cameraDescription) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          showInSnackBar('You have denied camera access.');
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar('Please go to Settings app to enable camera access.');
        case 'CameraAccessRestricted':
          // iOS only
          showInSnackBar('Camera access is restricted.');
        case 'AudioAccessDenied':
          showInSnackBar('You have denied audio access.');
        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          showInSnackBar('Please go to Settings app to enable audio access.');
        case 'AudioAccessRestricted':
          // iOS only
          showInSnackBar('Audio access is restricted.');
        default:
          _showCameraException(e);
          break;
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() async {
    setState(() {
      capturing = true;
    });
    final firstPictureIsFront =
        controller!.description.lensDirection == CameraLensDirection.front;
    final firstPicture = await takePicture();
    await switchCamera();
    final secondPicture = await takePicture();

    final frontPicture = firstPictureIsFront ? firstPicture : secondPicture;
    final backPicture = firstPictureIsFront ? secondPicture : firstPicture;
    setState(() {
      capturing = false;
    });
    navigateNewSubPage('/capture/preview', arguments: {
      'front': frontPicture,
      'back': backPicture,
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      setState(() {
        flashMode = mode;
      });
      await controller!.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}

void _logError(String code, String? message) {
  // ignore: avoid_print
  print('Error: $code${message == null ? '' : '\nError Message: $message'}');
}

List<CameraDescription> _cameras = <CameraDescription>[];
