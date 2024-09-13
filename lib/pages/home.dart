import 'package:dailyzap/helpers/api/urls.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/widgets/profile_picture.dart';
import 'package:dailyzap/pages/feed.dart';
import 'package:dailyzap/pages/friends/friends.dart';
import 'package:flutter/material.dart';
import 'package:june/june.dart';

class Page {
  final String title;
  final IconData icon;
  final Widget page;

  Page(this.title, this.icon, this.page);
}

List<Page> pages = [
  Page("Friends", Icons.people, const FriendsPage()),
  Page("Feed", Icons.home, FeedPage()),
  Page("Memories", Icons.calendar_month, const Center(child: Text("Memories"))),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  late PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageViewController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: pages
            .map((page) => BottomNavigationBarItem(
                  icon: Icon(page.icon),
                  label: page.title,
                ))
            .toList(),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("dailyZap"),
        actions: [
          IconButton(
              onPressed: () {
                navigateNewSubPage('/profile');
              },
              icon: JuneBuilder(() => CacheState(),
                  builder: (CacheState state) =>
                      ProfilePicture(url: getMyProfilePictureUrl()))),
        ],
      ),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageViewController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: pages.map((page) => page.page).toList()),
    );
  }
}
