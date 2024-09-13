import 'package:dailyzap/pages/add_friend.dart';
import 'package:dailyzap/pages/friend_requests.dart';
import 'package:dailyzap/pages/friendlist.dart';
import 'package:flutter/material.dart';

class TabInfo {
  final String text;
  final IconData icon;
  final Widget page;

  TabInfo({required this.text, required this.icon, required this.page});
}

List<TabInfo> tabs = [
  TabInfo(icon: Icons.people, text: "Friends", page: FriendListPage()),
  TabInfo(
      icon: Icons.people_outline,
      text: "Friend Requests",
      page: FriendRequestsPage()),
  TabInfo(icon: Icons.person_add, text: "Add Friends", page: AddFriendPage()),
];

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

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
        ));
  }
}
