import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class FriendListPage extends StatefulWidget {
  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  List<UserProps> friends = [];

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
      child: friends.isNotEmpty
          ? ListView.builder(
              itemCount: friends.length,
              itemBuilder: (BuildContext context, int index) {
                final friend = friends[index];
                return ListTile(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          "${friend.firstName} ${friend.lastName} (${friend.handle})"),
                    ],
                  ),
                );
              },
            )
          : const Center(child: Text("No friends")),
    );
  }
}
