import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  bool isMultiCamSupported = false;

  @override
  void initState() {
    super.initState();
    () async {
      final isSupported = await CamerawesomePlugin.isMultiCamSupported();
      setState(() {
        isMultiCamSupported = isSupported;
        // loading = false;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Test"),
        actions: [
          IconButton(
              onPressed: () {
                navigateNewSubPage('/profile');
              },
              icon: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: FastCachedImage(
                  loadingBuilder: (p0, p1) => Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  fit: BoxFit.cover,
                  errorBuilder: (p0, p1, p2) => const Icon(Icons.error),
                  headers: getAuthHeader(),
                  url: "${getApiBaseUrl()}/v1/profile/picture",
                ),
              )),
        ],
      ),
      body: loading
          ? TextButton(
              onPressed: () async {
                await logout();
                navigate('/');
              },
              child: const Text("Logout"),
            )
          : CameraAwesomeBuilder.awesome(
              saveConfig: SaveConfig.photo(),
              previewFit: CameraPreviewFit.contain,
              onMediaCaptureEvent: (mediaCapture) => {},
              previewPadding: const EdgeInsets.all(150),
              previewAlignment: Alignment.topRight,
              theme: AwesomeTheme(
                bottomActionsBackgroundColor: Colors.cyan.withOpacity(0.5),
                buttonTheme: AwesomeButtonTheme(
                  backgroundColor: Colors.cyan.withOpacity(0.5),
                  iconSize: 20,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  // Tap visual feedback (ripple, bounce...)
                  buttonBuilder: (child, onTap) {
                    return ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        shape: const CircleBorder(),
                        child: InkWell(
                          splashColor: Colors.cyan,
                          highlightColor: Colors.cyan.withOpacity(0.5),
                          onTap: onTap,
                          child: child,
                        ),
                      ),
                    );
                  },
                ),
              ),
              topActionsBuilder: (state) => AwesomeTopActions(
                padding: EdgeInsets.zero,
                state: state,
                children: const [],
              ),
              middleContentBuilder: (state) {
                return Container();
              },
              bottomActionsBuilder: (state) => AwesomeBottomActions(
                state: state,
                left: AwesomeFlashButton(
                  state: state,
                ),
                right: AwesomeCameraSwitchButton(
                  state: state,
                  scale: 1.0,
                  onSwitchTap: (state) {
                    state.switchCameraSensor(
                      aspectRatio: state.sensorConfig.aspectRatio,
                    );
                  },
                ),
              ),
              sensorConfig: isMultiCamSupported
                  ? SensorConfig.multiple(
                      sensors: [
                        Sensor.position(SensorPosition.back),
                        Sensor.position(SensorPosition.front),
                      ],
                      flashMode: FlashMode.auto,
                      aspectRatio: CameraAspectRatios.ratio_4_3,
                    )
                  : SensorConfig.single(
                      sensor: Sensor.position(SensorPosition.back),
                      flashMode: FlashMode.auto,
                      aspectRatio: CameraAspectRatios.ratio_4_3,
                    ),
            ),
    );
  }
}
