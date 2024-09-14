import 'package:carousel_slider/carousel_slider.dart';
import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/api/urls.dart';
import 'package:dailyzap/helpers/dates.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/widgets/network_zap.dart';
import 'package:dailyzap/helpers/widgets/profile_picture.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Content> content = [];
  List<Zap> myZaps = [];
  Map<String, UserProps> users = {};

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
        content = feed.friend.content;
        myZaps = feed.myZaps;
        users = feed.friend.users.fold({}, (prev, users) {
          prev[users.id] = users;
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
            return CarouselSlider.builder(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.3,
                aspectRatio: 3,
              ),
              itemCount: myZaps.length + 1,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                if (itemIndex == myZaps.length) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextButton(
                            onPressed: () async {
                              navigateNewSubPage('/capture');
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                              backgroundColor: Colors.white,
                            ),
                            child: const Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text("Capture")),
                          ))
                    ],
                  );
                }
                final zap = myZaps[itemIndex];
                return Container(
                    // width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: NetworkZap(
                      zap: zap,
                      borderRadius: 10,
                      onTap: () {
                        openZapsPage(
                            UserProps(
                                id: "id",
                                handle: "handle",
                                firstName: "firstName",
                                lastName: "lastName",
                                profilePictureUrl: getMyProfilePictureUrl()),
                            myZaps,
                            itemIndex);
                      },
                    ));
              },
            );
          }
          if (index == content.length + 1) {
            if (content.isNotEmpty) {
              return null;
            }
            return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child:
                      Text("No Zaps from your friends so far - be patient 😉"),
                ));
          }
          final thisContent = content[index - 1];
          final user = users[thisContent.userId]!;
          return CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 0.9,
              aspectRatio: 0.7,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enableInfiniteScroll: false,
            ),
            itemCount: thisContent.zaps.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              final zap = thisContent.zaps[itemIndex];

              String timeString = zap.lateBy != null
                  ? formatLate(zap.lateBy!)
                  : formatTime(
                      DateTime.fromMillisecondsSinceEpoch(zap.timestamp));

              return Column(
                children: [
                  InkWell(
                      onTap: () {
                        openFriendPage(user);
                      },
                      child: Row(
                        children: [
                          ProfilePicture(
                            url: user.profilePictureUrl,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.handle,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(timeString),
                            ],
                          )
                        ],
                      )),
                  NetworkZap(
                    zap: zap,
                  ),
                  InkWell(
                      onTap: () {
                        openZapsPage(user, thisContent.zaps, itemIndex);
                      },
                      child: Row(
                        children: [
                          ProfilePicture(
                            url: getMyProfilePictureUrl(),
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Leave a comment...",
                          ),
                        ],
                      )),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
