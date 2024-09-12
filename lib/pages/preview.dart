import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:camera/camera.dart';
import 'package:dailyzap/helpers/widgets/zap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';

class LocationResult {
  final double latitude;
  final double longitude;
  final String location;
  final String countryCode;

  LocationResult({
    required this.location,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
  });
}

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
  bool loadingLocation = false;
  LocationResult? location;

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
                          onPressed: () async {
                            setState(() {
                              loadingLocation = true;
                            });

                            if (location != null) {
                              setState(() {
                                location = null;
                                loadingLocation = false;
                              });
                              return;
                            }

                            try {
                              final Position position =
                                  await _determinePosition();
                              final List<Placemark> placemarks =
                                  await placemarkFromCoordinates(
                                      position.latitude, position.longitude);
                              final Placemark place = placemarks.first;
                              setState(() {
                                location = LocationResult(
                                  location: place.locality ??
                                      place.administrativeArea ??
                                      "Somewhere",
                                  countryCode: place.isoCountryCode ?? "",
                                  latitude: position.latitude,
                                  longitude: position.longitude,
                                );
                              });
                            } catch (e) {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                ),
                              );
                            } finally {
                              setState(() {
                                loadingLocation = false;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                  "Location${location == null ? "" : ": ${location!.location}, ${location!.countryCode}"}"),
                              if (loadingLocation)
                                const CircularProgressIndicator()
                              else if (location == null)
                                const Icon(Icons.location_off)
                              else
                                const Icon(Icons.location_on),
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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
