import 'package:dailyzap/firebase_options.dart';
import 'package:dailyzap/helpers/push_notifications/channels.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> setupPushNotifications() async {
  FirebaseMessaging.onBackgroundMessage(handleBackgroundPushNotification);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    handlePushNotification(message, false);
  });
}

@pragma('vm:entry-point')
Future<void> handleBackgroundPushNotification(RemoteMessage message) async {
  await handlePushNotification(message, true);
}

Future<void> handlePushNotification(
    RemoteMessage message, bool isBackground) async {
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

  await showNotification(
      response['title'], response['content'], PushNotificationChannels.zapTime);
}

Future<void> showNotification(
    String title, String content, PushNotificationChannel channel) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      await initializeLocalPushNotifications();
  NotificationDetails notificationDetails =
      NotificationDetails(android: channel.androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
      0, title, content, notificationDetails);
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
