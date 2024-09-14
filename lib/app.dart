import 'package:dailyzap/helpers/globals/navigator.dart';
import 'package:dailyzap/helpers/push_notifications/permissions.dart';
import 'package:dailyzap/pages/auth/auth_landing.dart';
import 'package:dailyzap/pages/capture/capture.dart';
import 'package:dailyzap/pages/friends/friend.dart';
import 'package:dailyzap/pages/home.dart';
import 'package:dailyzap/pages/landing.dart';
import 'package:dailyzap/pages/auth/login.dart';
import 'package:dailyzap/pages/capture/preview.dart';
import 'package:dailyzap/pages/profile.dart';
import 'package:dailyzap/pages/auth/registration.dart';
import 'package:dailyzap/pages/auth/otp.dart';
import 'package:dailyzap/pages/zaps.dart';
import 'package:flutter/material.dart';

class DailyZapApp extends StatelessWidget {
  const DailyZapApp({super.key});

  @override
  Widget build(BuildContext context) {
    requestPermissions();
    return MaterialApp(
      title: 'dailyZap',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const LandingPage(),
        '/home': (_) => const HomePage(),
        '/profile': (_) => const ProfilePage(),
        '/capture': (_) => const CapturePage(),
        '/capture/preview': (_) => const CapturePreviewPage(),
        '/auth': (_) => const AuthLandingPage(),
        '/auth/login': (_) => const LoginPage(),
        '/auth/otp': (_) => const OTPPage(),
        '/auth/register': (_) => const RegistrationPage(),
        '/friend': (_) => FriendPage(),
        '/zaps': (_) => ZapsPage(),
      },
    );
  }
}
