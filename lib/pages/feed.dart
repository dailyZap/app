import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Content> content = [];
  List<Zap> myZaps = [];
  Map<String, Author> authors = {};

  @override
  void initState() {
    super.initState();

    loadFeed();
  }

  Future<void> loadFeed() async {
    try {
      final feed = await feedApi.getFeed();
      if (feed == null) {
        return;
      }
      setState(() {
        content = feed.content;
        // myZaps = feed.myZaps;
        authors = feed.authors.fold({}, (prev, author) {
          prev[author.id] = author;
          return prev;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _handleRefresh() async {
    await loadFeed();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: ListView.builder(
        itemCount: content.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(
              height: 200,
              child: TextButton(
                onPressed: () async {
                  navigateNewSubPage('/capture');
                },
                child: const Text("Capture"),
              ),
            );
          }
          if (index == content.length + 1) {
            if (content.length > 1) {
              return null;
            }
            return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child:
                      Text("No Zaps from your friends so far - be patient 😉"),
                ));
          }
          return ListTile(
            title: Text(content[index].userId),
          );
        },
      ),
    );
  }
}
