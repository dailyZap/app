import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/push_notifications/permissions.dart';
import 'package:flutter/material.dart';
import 'package:dailyzap_api/api.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String? loginToken;
  String? handleOrEmail;

  bool loading = false;
  bool? success;
  bool resendingCode = false;

  AuthApi? api;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    loginToken = args['loginToken'];
    handleOrEmail = args['handleOrEmail'];

    print("✅ loginToken: $loginToken");
    print("✅ handleOrEmail: $handleOrEmail");

    if (loginToken == null || handleOrEmail == null) {
      setState(() {
        loading = false;
        success = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (success != null && !success!) {
      return const Scaffold(
        body: Center(
          child: Text('Invalid login token'),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('OTP Code'),
            Pinput(
              length: 6,
              onCompleted: (pin) async {
                setState(() {
                  loading = true;
                });
                try {
                  final response = await authApi.otp(OTPParams(
                      loginToken: loginToken!,
                      otp: pin,
                      deviceToken: deviceToken));
                  if (response == null) {
                    setState(() {
                      loading = false;
                    });
                    return;
                  }
                  await setSessionToken(response.sessionToken);
                  navigate('/home');
                } on ApiException catch (e) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Invalid OTP code (${e.message})'),
                  ));
                  setState(() {
                    loading = false;
                  });
                }
              },
            ),
            TextButton(
                onPressed: () async {
                  setState(() {
                    resendingCode = true;
                  });
                  try {
                    loginToken = (await authApi
                            .login(LoginParams(handleOrEmail: handleOrEmail!)))!
                        .loginToken;
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('New code sent'),
                    ));
                  } on ApiException catch (e) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Failed to resend code (${e.message})'),
                    ));
                  }
                  setState(() {
                    resendingCode = false;
                  });
                },
                child: resendingCode
                    ? const CircularProgressIndicator()
                    : const Text('Resend code')),
          ],
        ),
      ),
    );
  }
}
