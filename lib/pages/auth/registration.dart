import 'dart:convert';

import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PrettyRegion {
  final Region region;
  final String name;
  final Icon icon;

  const PrettyRegion(this.region, this.name, this.icon);
}

const regions = [
  PrettyRegion(Region.EU, 'Europe', Icon(Icons.flag)),
  PrettyRegion(Region.US, 'United States', Icon(Icons.flag)),
  PrettyRegion(Region.WA, 'West Asia', Icon(Icons.flag)),
  PrettyRegion(Region.EA, 'East Asia', Icon(Icons.flag)),
];

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? server;
  String? token;
  ServerInfo? serverInfo;

  bool loading = true;
  bool success = false;
  bool registering = false;

  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

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

    load();
  }

  void load() async {
    await setServerUrl(server!);
    try {
      await authApi.checkInvite(token!);
      final info = await infoApi.getServerInfo();
      setState(() {
        serverInfo = info;
        loading = false;
        success = true;
      });
    } catch (e) {
      // ToDo: Show error message
      print(e);
      setState(() {
        loading = false;
        success = false;
      });
    }
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
            const Text("in Region"),
            Text(serverInfo!.region.toString()),
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'firstname',
                    decoration: const InputDecoration(labelText: 'First Name'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'lastname',
                    decoration: const InputDecoration(labelText: 'Last Name'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    key: _emailFieldKey,
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'handle',
                    decoration: const InputDecoration(labelText: 'Handle'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(3),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderChoiceChip(
                      name: 'region',
                      initialValue: serverInfo!.region,
                      decoration: const InputDecoration(labelText: 'Region'),
                      options: regions
                          .map((e) => FormBuilderChipOption(
                              value: e.region,
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Text(e.name)])))
                          .toList()),
                  const SizedBox(height: 10),
                  FormBuilderFieldDecoration<bool>(
                    name: 'terms',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.equal(true,
                          errorText: "You must accept the terms to continue"),
                    ]),
                    decoration:
                        const InputDecoration(labelText: 'Accept Terms?'),
                    builder: (FormFieldState<bool?> field) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          errorText: field.errorText,
                        ),
                        child: SwitchListTile(
                          title: const Text(
                              'I have read and accept the terms of service.'),
                          onChanged: field.didChange,
                          value: field.value ?? false,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (!(_formKey.currentState?.saveAndValidate() ??
                          false)) {
                        return;
                      }

                      setState(() {
                        registering = true;
                      });
                      try {
                        final response = await authApi.register(
                            UserCreationParams(
                                region: _formKey
                                    .currentState?.fields['region']?.value,
                                handle: _formKey
                                    .currentState?.fields['handle']?.value,
                                email: _formKey
                                    .currentState?.fields['email']?.value,
                                firstName: _formKey
                                    .currentState?.fields['firstname']?.value,
                                lastName: _formKey
                                    .currentState?.fields['lastname']?.value));
                        if (response == null) {
                          return;
                        }
                        navigate("/auth/otp", arguments: {
                          "loginToken": response.loginToken,
                          "handleOrEmail":
                              _formKey.currentState?.fields['handle']!.value
                        });
                      } on ApiException catch (e) {
                        setState(() {
                          registering = false;
                        });

                        if (e.code == 409) {
                          // e.message is a json with field field
                          final field =
                              jsonDecode(e.message!)['field'] as String;
                          _formKey.currentState?.fields[field]
                              ?.invalidate('This $field is already in use');
                        } else {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Registration failed: ${e.message}'),
                          ));
                        }
                        return;
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (registering)
                          const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        if (registering)
                          const SizedBox(width: 10)
                        else
                          const Text('Register'),
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
