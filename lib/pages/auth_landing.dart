import 'package:dailyzap/helpers/constants/uris.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthLandingPage extends StatelessWidget {
  const AuthLandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              ElevatedButton(
                onPressed: () {
                  navigateNewSubPage('/auth/login');
                },
                child: const Text('Login'),
              ),
              Text("Don't have an account?"),
              Text("ask someone who already uses the app for an invite or"),
              ElevatedButton(
                onPressed: () {
                  launchUrl(selfhostServerUrl,
                      mode: LaunchMode.externalApplication);
                },
                child: const Text('Selfhost your own Server'),
              ),
            ],
          )
        ]));
  }
}
