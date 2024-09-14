import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/push_notifications/push_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    final loggedIn = await initHomeServerApi();
    if (!loggedIn) {
      navigate('/auth');
    } else {
      navigate('/home');
      final NotificationAppLaunchDetails? notificationAppLaunchDetails =
          await (await initializeLocalPushNotifications())
              .getNotificationAppLaunchDetails();
      if ((notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) &&
          notificationAppLaunchDetails!.notificationResponse != null) {
        await handleNotificationTap(
            notificationAppLaunchDetails.notificationResponse!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
