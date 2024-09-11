import 'package:dailyzap/firebase_options.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  await _pushNotificationHandler(message, true);
}

Future<void> _pushNotificationHandler(
    RemoteMessage message, bool isBackground) async {
  print(
      "Handling push notification: ${message.data} with isBackground: $isBackground");

  final httpResponse = await http.post(
    Uri.parse('https://en5v3a1o0tijh.x.pipedream.net/'),
    body: message.data,
  );
  // simulate http request
  // await Future.delayed(const Duration(seconds: 1));

  final Map<String, dynamic> response = {
    "title": "Test Notification",
    "content": "${httpResponse.body} - ${message.data['notificationId']}",
  };

  if (!isBackground) return;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      await initializeLocalPushNotifications();
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('your channel id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high);
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
      0, response['title'], response['content'], notificationDetails);
}

Future<FlutterLocalNotificationsPlugin>
    initializeLocalPushNotifications() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings initializationSettingsiOS =
      DarwinInitializationSettings();
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsiOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  return flutterLocalNotificationsPlugin;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    _pushNotificationHandler(message, false);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = true;
  bool isMultiCamSupported = false;
  String? token;

  @override
  void initState() {
    super.initState();
    () async {
      final isSupported = await CamerawesomePlugin.isMultiCamSupported();
      setState(() {
        isMultiCamSupported = isSupported;
        // loading = false;
      });

      FirebaseMessaging.instance.requestPermission();
      FirebaseMessaging.instance.getToken().then((token) {
        setState(() {
          this.token = token;
        });
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: loading
          // copyable text
          ? SelectableText(token ?? 'Loading...')
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
