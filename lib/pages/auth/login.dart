import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  bool success = false;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Login'),
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'server',
                    decoration: const InputDecoration(labelText: 'Server'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.url(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'handleOrEmail',
                    decoration:
                        const InputDecoration(labelText: 'Handle or Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (!(_formKey.currentState?.saveAndValidate() ??
                          false)) {
                        return;
                      }
                      setState(() {
                        loading = true;
                      });
                      try {
                        await setServerUrl(
                            _formKey.currentState?.fields['server']!.value);
                        final response = await authApi!.login(UserLoginParams(
                            handleOrEmail: _formKey
                                .currentState?.fields['handleOrEmail']!.value));
                        if (response == null) {
                          return;
                        }
                        print("🎉 response: $response");
                        navigateNewSubPage("/auth/2fa", arguments: {
                          "loginToken": response.loginToken,
                          "handleOrEmail": _formKey
                              .currentState?.fields['handleOrEmail']!.value
                        });
                      } on ApiException catch (e) {
                        setState(() {
                          loading = false;
                        });

                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Registration failed: ${e.message}'),
                        ));
                        return;
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (loading)
                          const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ))
                        else
                          const Text('Login')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
