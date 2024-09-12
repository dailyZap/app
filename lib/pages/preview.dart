import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dailyzap/helpers/widgets/zap.dart';
import 'package:flutter/material.dart';

class CapturePreviewPage extends StatefulWidget {
  const CapturePreviewPage({super.key});

  @override
  State<CapturePreviewPage> createState() => _CapturePreviewPageState();
}

class _CapturePreviewPageState extends State<CapturePreviewPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  XFile? frontPicture;
  XFile? backPicture;

  bool loading = true;

  @override
  void dispose() {
    super.dispose();

    if (frontPicture != null) {
      File(frontPicture!.path).delete();
    }
    if (backPicture != null) {
      File(backPicture!.path).delete();
    }
    print("Deleted files");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // get front and back pictures
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    frontPicture = arguments['front'] as XFile?;
    backPicture = arguments['back'] as XFile?;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Preview"),
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 400,
                    child: Zap(
                      frontPicture: Image.file(File(frontPicture!.path)),
                      backPicture: Image.file(File(backPicture!.path)),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            //
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.location_off),
                              Text("Location"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              //
                            },
                            child: const Row(
                              children: [
                                Text("Post"),
                                Icon(Icons.send),
                              ],
                            )),
                      ),
                    ],
                  )
                ],
              ));
  }
}
