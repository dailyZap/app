import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dailyzap/helpers/api/urls.dart';
import 'package:dailyzap/helpers/dates.dart';
import 'package:dailyzap/helpers/math.dart';
import 'package:dailyzap/helpers/widgets/network_zap.dart';
import 'package:dailyzap/helpers/widgets/profile_picture.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class ZapsPage extends StatefulWidget {
  @override
  _ZapsPageState createState() => _ZapsPageState();
}

class _ZapsPageState extends State<ZapsPage> {
  List<Zap> zaps = [];
  int? index;
  User? user;

  final double minZapHeight = 200;
  final double maxZapHeight = 500;
  late double zapHeight;

  @override
  void initState() {
    super.initState();
    zapHeight = maxZapHeight;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    setState(() {
      zaps = arguments['zaps'];
      index = arguments['index'];
      user = arguments['user'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: user != null && zaps.isNotEmpty && index != null
            ? Row(
                children: [
                  ProfilePicture(
                    url: user!.profilePictureUrl,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user!.handle,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                        Text(
                            "${formatTime(DateTime.fromMillisecondsSinceEpoch(zaps[index!].timestamp))} - ${zaps[index!].lateBy != null ? formatLate(zaps[index!].lateBy!) : 'on time'}",
                            style: const TextStyle(fontSize: 12))
                      ])
                ],
              )
            : null,
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: const Color.fromARGB(255, 184, 184, 184),
            ),
            child: const Row(
              children: [
                Icon(Icons.location_on),
                Text('Berlin, DE'),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: zaps.isNotEmpty && zaps.isNotEmpty && index != null
          ? Column(
              children: [
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification.metrics.axis != Axis.vertical) {
                          return false;
                        }
                        final double newZapHeight = max(minZapHeight,
                            maxZapHeight - scrollNotification.metrics.pixels);
                        if (newZapHeight != zapHeight) {
                          setState(() {
                            zapHeight = newZapHeight;
                          });
                        }
                        return true;
                      },
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: maxZapHeight - zapHeight,
                            ),
                            CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: zapHeight,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      this.index = index;
                                    });
                                  },
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  viewportFraction: map(minZapHeight,
                                      maxZapHeight, 0.3, 1, zapHeight),
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.zoom,
                                  enlargeFactor: 0.3,
                                ),
                                itemCount: zaps.length,
                                itemBuilder: (BuildContext context, int index,
                                        int count) =>
                                    NetworkZap(
                                        zap: zaps[index],
                                        borderRadius:
                                            30 * (zapHeight / maxZapHeight))),
                            const SizedBox(
                              height: 20,
                            ),
                            ...List.generate(
                              5,
                              (index) {
                                final text = 'Comment for ${this.index}';
                                return ListTile(
                                  onTap: () {},
                                  visualDensity: VisualDensity.compact,
                                  leading: ProfilePicture(
                                    size: 20,
                                    url: getMyProfilePictureUrl(),
                                  ),
                                  title: Text(text),
                                );
                              },
                            ),
                            const SizedBox(height: 200),
                          ]))),
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a comment',
                        ),
                      ),
                    )),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            )
          : const Center(child: Text('No zap')),
    );
  }
}
