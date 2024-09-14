import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/api/urls.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePicture extends StatelessWidget {
  final String url;
  final double size;

  const ProfilePicture({
    super.key,
    this.size = 50,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 20),
            fit: BoxFit.cover,
            key: url == getMyProfilePictureUrl()
                ? Key(getMyProfilePictureUrl())
                : null,
            httpHeaders: getAuthHeader(),
            imageUrl: url,
          ),
        ));
  }
}
