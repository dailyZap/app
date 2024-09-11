import 'package:app_links/app_links.dart';
import 'package:dailyzap/app.dart';
import 'package:dailyzap/helpers/navigation/deep_links.dart';
import 'package:dailyzap/helpers/push_notifications/push_notifications.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupPushNotifications();
  final appLinks = AppLinks();
  appLinks.uriLinkStream.listen((uri) {
    handleDeepLink(uri);
  });
  runApp(const DailyZapApp());
}
