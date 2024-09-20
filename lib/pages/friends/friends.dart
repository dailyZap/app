import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:dailyzap/pages/friends/friend_requests.dart';
import 'package:dailyzap/pages/friends/friendlist.dart';
import 'package:dailyzap/pages/friends/gridview.dart';
import 'package:flutter/material.dart';

class TabInfo {
  final String text;
  final IconData icon;
  final Widget page;

  TabInfo({required this.text, required this.icon, required this.page});
}

List<TabInfo> tabs = [
  TabInfo(
      icon: Icons.grid_view_rounded,
      text: "Grid View",
      page: ZapGridViewPage()),
  TabInfo(icon: Icons.people, text: "Friends", page: FriendListPage()),
  TabInfo(
      icon: Icons.people_outline,
      text: "Friend Requests",
      page: FriendRequestsPage()),
];

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  bool loadingShareLink = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: TabBar(
              tabs: tabs
                  .map((tab) => Tab(
                        icon: Icon(tab.icon),
                        text: tab.text,
                      ))
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: tabs.map((tab) => tab.page).toList(),
          ),
          floatingActionButton:
              Column(mainAxisSize: MainAxisSize.min, children: [
            FloatingActionButton(
              heroTag: "share",
              onPressed: () async {
                setState(() {
                  loadingShareLink = true;
                });
                final profile = await profileApi.getProfile();
                final link = profile!.inviteUrl;
                setState(() {
                  loadingShareLink = false;
                });
                Share.share(link);
              },
              child: loadingShareLink
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.share),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: "add",
              onPressed: () {
                navigateNewSubPage("/friend/add");
              },
              child: const Icon(Icons.person_add),
            )
          ]),
        ));
  }
}
