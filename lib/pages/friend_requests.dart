import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/confirm.dart';
import 'package:dailyzap/helpers/widgets/profile_picture.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class FriendRequestsPage extends StatefulWidget {
  @override
  _FriendRequestsPageState createState() => _FriendRequestsPageState();
}

class _FriendRequestsPageState extends State<FriendRequestsPage> {
  FriendRequestsResponseProps? friendRequests;

  String? deletingFriendRequest;
  String? acceptingFriendRequest;
  String? decliningFriendRequest;

  @override
  void initState() {
    super.initState();

    loadFriendRequests();
  }

  Future<void> loadFriendRequests() async {
    final result = await friendsApi.getFriendRequests();
    if (result == null) {
      return;
    }
    setState(() {
      friendRequests = result;
    });
  }

  Future<void> _handleRefresh() async {
    await loadFriendRequests();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView(children: [
          const ListTile(title: Text("Incoming Friend Requests")),
          for (UserProps friend in friendRequests?.incoming ?? [])
            ListTile(
              leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: ProfilePicture(url: friend.profilePictureUrl)),
              title: Text(
                  "${friend.firstName} ${friend.lastName} (${friend.handle})"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: acceptingFriendRequest == friend.handle
                          ? null
                          : () async {
                              if (!await confirm("Accept friend request",
                                  "Are you sure you want to accept the friend request from ${friend.handle}?")) {
                                return;
                              }
                              setState(() {
                                acceptingFriendRequest = friend.handle;
                              });
                              await friendsApi.acceptFriendship(friend.id);
                              await loadFriendRequests();
                              setState(() {
                                acceptingFriendRequest = null;
                              });
                            },
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.green),
                      ),
                      child: acceptingFriendRequest == friend.handle
                          ? const CircularProgressIndicator()
                          : const Icon(Icons.check)),
                  TextButton(
                      onPressed: decliningFriendRequest == friend.handle
                          ? null
                          : () async {
                              if (!await confirm("Decline friend request",
                                  "Are you sure you want to decline the friend request from ${friend.handle}?")) {
                                return;
                              }
                              setState(() {
                                decliningFriendRequest = friend.handle;
                              });
                              await friendsApi.rejectFriendship(friend.id);
                              await loadFriendRequests();
                              setState(() {
                                decliningFriendRequest = null;
                              });
                            },
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.red),
                      ),
                      child: decliningFriendRequest == friend.handle
                          ? const CircularProgressIndicator()
                          : const Icon(Icons.cancel)),
                ],
              ),
            ),
          if (friendRequests == null || friendRequests!.incoming.isEmpty)
            const Center(child: Text("No incoming friend requests")),
          const ListTile(title: Text("Outgoing Friend Requests")),
          for (final friend in friendRequests?.outgoing ?? [])
            ListTile(
              leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: ProfilePicture(url: friend.profilePictureUrl)),
              title: Text(
                  "${friend.firstName} ${friend.lastName} (${friend.handle})"),
              trailing: TextButton(
                  onPressed: deletingFriendRequest == friend.handle
                      ? null
                      : () async {
                          if (!await confirm("Delete friend request",
                              "Are you sure you want to delete the friend request to ${friend.handle}?")) {
                            setState(() {
                              deletingFriendRequest = friend.handle;
                            });
                            await friendsApi.deleteFriendRequest(friend.handle);
                            await loadFriendRequests();
                            setState(() {
                              deletingFriendRequest = null;
                            });
                          }
                        },
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  child: deletingFriendRequest == friend.handle
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.cancel)),
            ),
          if (friendRequests == null || friendRequests!.outgoing.isEmpty)
            const Center(child: Text("No outgoing friend requests")),
        ]));
  }
}
