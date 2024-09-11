import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
// get server and token from route arguments
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String? server = args['server'];
    final String? token = args['token'];

    if (server == null || token == null) {
      return const Scaffold(
        body: Center(
          child: Text('Invalid registration link'),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Registration'),
            const Text('You are about to join the server'),
            Text(server),
            const Text('With the token'),
            Text(token),
          ],
        ),
      ),
    );
  }
}
