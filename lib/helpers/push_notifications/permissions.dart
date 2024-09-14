import 'package:dailyzap/helpers/globals/navigator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

late String deviceToken;

Future<void> requestPermissions() async {
  final result = await FirebaseMessaging.instance.requestPermission(
      provisional: true,
      alert: true,
      badge: true,
      sound: true,
      announcement: true);
  if (result.authorizationStatus != AuthorizationStatus.authorized) {
    if (navigatorKey.currentContext == null) return;
    await showDialog(
        context: navigatorKey.currentContext!,
        builder: (_) => AlertDialog(
              title: const Text('Permission denied'),
              content: const Text(
                  'Please allow notifications to receive dailyZap notifications'),
              actions: [
                TextButton(
                    onPressed: () {
                      navigatorKey.currentState!.pop();
                    },
                    child: const Text('Retry'))
              ],
            ));
    requestPermissions();
  }
  FirebaseMessaging.instance.getToken().then((token) {
    deviceToken = token!;
  });
  FirebaseMessaging.instance.subscribeToTopic("time-to-zap.eu");
}
