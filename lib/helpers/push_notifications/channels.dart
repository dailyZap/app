import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationChannel {
  String id;
  String name;
  String description;
  Importance importance;
  Priority priority;

  PushNotificationChannel({
    required this.id,
    required this.name,
    required this.description,
    required this.importance,
    required this.priority,
  });

  AndroidNotificationDetails get androidNotificationDetails =>
      AndroidNotificationDetails(
        id,
        name,
        channelDescription: description,
        importance: importance,
        priority: priority,
      );
}

class PushNotificationChannels {
  static final PushNotificationChannel zapTime = PushNotificationChannel(
    id: 'zap_time',
    name: 'Zap Time',
    description: 'Time to zap!',
    importance: Importance.max,
    priority: Priority.high,
  );
}
