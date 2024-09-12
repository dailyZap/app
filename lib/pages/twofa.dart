import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/constants/storage_keys.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:dailyzap_api/api.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TwoFaPage extends StatefulWidget {
  const TwoFaPage({Key? key}) : super(key: key);
  @override
  _TwoFaPageState createState() => _TwoFaPageState();
}

class _TwoFaPageState extends State<TwoFaPage> {
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
            const Text('2FA Code'),
            Pinput(
              length: 6,
              onCompleted: (pin) async {
                setState(() {
                  loading = true;
                });
                try {
                  final response = await authApi!.twoFa(
                      UserTwoFaParams(loginToken: loginToken!, twoFaCode: pin));
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
                    content: Text('Invalid 2FA code (${e.message})'),
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
                    loginToken = (await authApi!.login(
                            UserLoginParams(handleOrEmail: handleOrEmail!)))!
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
