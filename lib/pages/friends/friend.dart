import 'package:dailyzap_api/api.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  UserProps? friend;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    setState(() {
      friend = arguments['friend'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: friend != null
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  FastCachedImage(url: friend!.profilePictureUrl),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Colors.white.withOpacity(0.5)),
                        foregroundColor: WidgetStateProperty.all(Colors.black),
                      ),
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${friend!.firstName} ${friend!.lastName}',
                      style: TextStyle(fontSize: 24)),
                  Text(friend!.handle),
                ],
              ),
            ])
          : const Center(child: Text('No friend selected')),
    );
  }
}
