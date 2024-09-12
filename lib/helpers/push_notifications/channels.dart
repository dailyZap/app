import 'package:dailyzap_api/api.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationChannel {
  final String id;
  final String name;
  final String description;
  final Importance? importance;
  final Priority? priority;

  const PushNotificationChannel({
    required this.id,
    required this.name,
    required this.description,
    this.importance,
    this.priority,
  });

  AndroidNotificationDetails get androidNotificationDetails =>
      AndroidNotificationDetails(
        id,
        name,
        channelDescription: description,
        importance: importance ?? Importance.defaultImportance,
        priority: priority ?? Priority.defaultPriority,
      );
}

PushNotificationChannel getNotificationChannelForType(NotificationType type) {
  switch (type) {
    case NotificationType.ZAP_NOW:
      return const PushNotificationChannel(
        id: 'zap_now',
        name: 'Zap Now',
        description: 'Zap Now Notifications',
        importance: Importance.max,
        priority: Priority.high,
      );
    case NotificationType.FRIEND_REQUEST:
      return const PushNotificationChannel(
        id: 'friend_request',
        name: 'Friend Request',
        description: 'Friend Request Notifications',
      );
    case NotificationType.NEW_COMMENT:
      return const PushNotificationChannel(
        id: 'new_comment',
        name: 'New Comment',
        description: 'New Comment Notifications',
      );
    case NotificationType.NEW_DAILY_ZAP:
      return const PushNotificationChannel(
        id: 'new_daily_zap',
        name: 'New Daily Zap',
        description: 'New Daily Zap Notifications',
      );
    case NotificationType.NEW_REACTION:
      return const PushNotificationChannel(
        id: 'new_reaction',
        name: 'New Reaction',
        description: 'New Reaction Notifications',
      );
    case NotificationType.TAGGED:
      return const PushNotificationChannel(
        id: 'tagged',
        name: 'Tagged',
        description: 'Tagged Notifications',
      );
  }
  throw ArgumentError('Invalid notification type: $type');
}
