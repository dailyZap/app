import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/widgets/profile_picture.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  User? friend;

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
                  CachedNetworkImage(
                    imageUrl: friend!.profilePictureUrl,
                    httpHeaders: getAuthHeader(),
                  ),
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
