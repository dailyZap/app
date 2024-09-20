import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/widgets/profile_picture.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class FriendListPage extends StatefulWidget {
  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  List<User> friends = [];

  @override
  void initState() {
    super.initState();

    loadFriends();
  }

  Future<void> loadFriends() async {
    final result = await friendsApi.getFriends();
    if (result == null) {
      return;
    }
    setState(() {
      friends = result.friends;
    });
  }

  Future<void> _handleRefresh() async {
    await loadFriends();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          itemCount: friends.isEmpty ? 1 : friends.length,
          itemBuilder: (BuildContext context, int index) {
            if (friends.isEmpty) {
              return const Center(child: Text("No friends yet"));
            }
            final friend = friends[index];
            return ListTile(
              leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: ProfilePicture(url: friend.profilePictureUrl)),
              title: Text(
                "${friend.firstName} ${friend.lastName}",
              ),
              subtitle: Text(friend.handle),
              onTap: () {
                openFriendPage(friend);
              },
            );
          },
        ));
  }
}
