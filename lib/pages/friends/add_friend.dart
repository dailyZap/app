import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class AddFriendPage extends StatefulWidget {
  @override
  _AddFriendPageState createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  late TextEditingController _handleController;

  bool requestingFriendship = false;

  @override
  void initState() {
    super.initState();
    _handleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Friend'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _handleController,
              decoration: const InputDecoration(
                labelText: 'Handle',
              ),
            ),
            ElevatedButton(
              onPressed: requestingFriendship
                  ? null
                  : () async {
                      setState(() {
                        requestingFriendship = true;
                      });
                      try {
                        await friendsApi
                            .requestFriendship(_handleController.text);
                      } on ApiException catch (e) {
                        if (!context.mounted) {
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.message ?? 'An error occurred'),
                        ));
                      }
                      setState(() {
                        requestingFriendship = false;
                      });
                    },
              child: requestingFriendship
                  ? const CircularProgressIndicator()
                  : const Text('Add Friend'),
            ),
          ],
        ));
  }
}
