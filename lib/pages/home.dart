import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/pages/feed.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  final List<Widget> _pages = <Widget>[
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("All Zaps"),
          Icon(Icons.grid_view_rounded),
        ],
      ),
    ),
    FeedPage(),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Memories"),
          Icon(Icons.calendar_month),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
        items: const [
          BottomNavigationBarItem(
            label: "All Zaps",
            icon: Icon(Icons.grid_view_rounded),
          ),
          BottomNavigationBarItem(
            label: "Feed",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Memories",
            icon: Icon(Icons.calendar_month),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("dailyZap"),
        actions: [
          IconButton(
              onPressed: () {
                navigateNewSubPage('/profile');
              },
              icon: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: FastCachedImage(
                  loadingBuilder: (p0, p1) => Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  fit: BoxFit.cover,
                  errorBuilder: (p0, p1, p2) => const Icon(Icons.error),
                  headers: getAuthHeader(),
                  url: "${getApiBaseUrl()}/v1/profile/picture",
                ),
              )),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
