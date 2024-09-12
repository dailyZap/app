import 'package:dailyzap/firebase_options.dart';
import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/push_notifications/channels.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> setupPushNotifications() async {
  FirebaseMessaging.onBackgroundMessage(handleBackgroundPushNotification);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    checkPushNotifications();
  });
}

@pragma('vm:entry-point')
Future<void> handleBackgroundPushNotification(RemoteMessage message) async {
  await initHomeServerApi();
  await checkPushNotifications();
}

Future<void> checkPushNotifications() async {
  try {
    final notifications = await notificationsApi.fetchNotifications();
    // if (!isBackground) return;

    for (final notification in notifications?.notifications ?? []) {
      await showNotification(notification.title, notification.content,
          getNotificationChannelForType(notification.type));
    }
  } catch (e) {
    return;
  }
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
