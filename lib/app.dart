import 'package:dailyzap/helpers/globals/navigator.dart';
import 'package:dailyzap/helpers/push_notifications/permissions.dart';
import 'package:dailyzap/pages/auth_landing.dart';
import 'package:dailyzap/pages/home.dart';
import 'package:dailyzap/pages/landing.dart';
import 'package:dailyzap/pages/login.dart';
import 'package:dailyzap/pages/registration.dart';
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
        '/auth': (_) => const AuthLandingPage(),
        '/auth/login': (_) => const LoginPage(),
        '/auth/register': (_) => const RegistrationPage(),
      },
    );
  }
}
