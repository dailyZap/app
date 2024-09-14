import 'dart:io';
import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap_api/api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:camera/camera.dart';
import 'package:dailyzap/helpers/widgets/interactive_zap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  bool posting = false;
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
                    child: InteractiveZap(
                      width: 300,
                      frontPicture: Image.file(File(frontPicture!.path)),
                      backPicture: Image.file(File(backPicture!.path)),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: loadingLocation
                              ? null
                              : () async {
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
                                            position.latitude,
                                            position.longitude);
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
                            onPressed: posting
                                ? null
                                : () async {
                                    setState(() {
                                      posting = true;
                                    });

                                    try {
                                      final data = (await zapsApi.createZap(
                                          ZapCreationParams(
                                              timestamp: DateTime.now()
                                                  .millisecondsSinceEpoch)))!;
                                      await http.put(
                                        Uri.parse(data.uploadFrontUrl),
                                        body: File(frontPicture!.path)
                                            .readAsBytesSync(),
                                      );
                                      await http.put(
                                        Uri.parse(data.uploadBackUrl),
                                        body: File(backPicture!.path)
                                            .readAsBytesSync(),
                                      );
                                      await zapsApi.setZapUploaded(data.zapId);
                                      setState(() {
                                        posting = false;
                                      });
                                      navigate('/home');
                                    } catch (e) {
                                      if (!context.mounted) return;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(e.toString()),
                                        ),
                                      );
                                    } finally {
                                      setState(() {
                                        posting = false;
                                      });
                                    }
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

    return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.low, timeLimit: Duration(seconds: 20)));
  }
}
