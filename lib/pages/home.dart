import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    loadFeed();
  }

  void loadFeed() async {
    try {
      final feed = await feedApi.getFeed();
      print(feed);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Test"),
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
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                navigateNewSubPage('/capture');
              },
              child: const Text("Capture"),
            ),
          ],
        ));
  }
}
