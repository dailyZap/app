import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dailyzap_api/api.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? server;
  String? token;

  bool loading = true;
  bool success = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    server = args['server'];
    token = args['token'];

    if (server == null || token == null) {
      setState(() {
        loading = false;
        success = false;
      });
      return;
    }

    setState(() {
      loading = true;
    });

    DefaultApi api = DefaultApi(
        ApiClient(basePath: "http${kDebugMode ? '' : 's'}://$server"));
    print("🚀 Server: $server");
    print("🚀 Token: $token");
    print("🚀 Checking invite");
    api.checkInvite(token!).then((value) {
      print("✅ Invite checked");
      setState(() {
        loading = false;
        success = true;
      });
    }).catchError((error) {
      print("❌ Invite check failed");
      // ToDo: Show error message
      print(error);
      setState(() {
        loading = false;
        success = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
// get server and token from route arguments

    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!success) {
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
            Text(server!),
            const Text('With the valid token'),
            Text(token!),
          ],
        ),
      ),
    );
  }
}
