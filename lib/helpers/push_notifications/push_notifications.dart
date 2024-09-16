import 'dart:developer';

import 'package:dailyzap/firebase_options.dart';
import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/push_notifications/channels.dart';
import 'package:dailyzap_api/api.dart' hide NotificationResponse;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> setupPushNotifications() async {
  FirebaseMessaging.onBackgroundMessage(handleBackgroundPushNotification);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    await handleNotification(message);
  });
}

@pragma('vm:entry-point')
Future<void> handleBackgroundPushNotification(RemoteMessage message) async {
  await handleNotification(message);
}

Future<void> handleNotification(RemoteMessage message) async {
  await initHomeServerApi();
  if (message.from != null && message.from!.startsWith('/topics/')) {
    await handleTopicNotification(message);
  } else {
    await checkPushNotifications();
  }
}

Future<void> handleTopicNotification(RemoteMessage message) async {
  final topic = message.from!.substring(8);
  final topicParts = topic.split('.');
  switch (topicParts[0]) {
    case 'time-to-zap':
      await handleTimeToZapNotification(message, topicParts.sublist(1));
      break;
    default:
      log('Unknown topic: $topic');
  }
}

Future<void> handleTimeToZapNotification(
    RemoteMessage message, List<String> arguments) async {
  if (arguments.isEmpty) {
    log('Invalid time-to-zap notification');
    return;
  }
  if (arguments[0] != 'eu') {
    log('Wrong time-to-zap notification region: ${arguments[0]}');
  }
  // spawn notification
  await showNotification('DailyZap', 'Time to zap!',
      getNotificationChannelForType(NotificationType.ZAP_NOW),
      payload: 'time-to-zap');
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
    String title, String content, PushNotificationChannel channel,
    {String? payload}) async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      await initializeLocalPushNotifications();
  NotificationDetails notificationDetails =
      NotificationDetails(android: channel.androidNotificationDetails);
  await flutterLocalNotificationsPlugin
      .show(0, title, content, notificationDetails, payload: payload);
}

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<FlutterLocalNotificationsPlugin>
    initializeLocalPushNotifications() async {
  if (flutterLocalNotificationsPlugin != null) {
    return flutterLocalNotificationsPlugin!;
  }

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings initializationSettingsiOS =
      DarwinInitializationSettings();
  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsiOS);
  await flutterLocalNotificationsPlugin!.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse r) async {
    await handleNotificationTap(r);
  });
  return flutterLocalNotificationsPlugin!;
}

Future<void> handleNotificationTap(NotificationResponse r) async {
  if (r.payload == "time-to-zap") {
    navigateNewSubPage('/capture');
  }
}
