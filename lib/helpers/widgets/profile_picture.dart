import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/api/urls.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePicture extends StatelessWidget {
  final String url;

  const ProfilePicture({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        key: url == getMyProfilePictureUrl()
            ? Key(getMyProfilePictureUrl())
            : null,
        errorBuilder: (p0, p1, p2) => const Icon(Icons.error),
        headers: getAuthHeader(),
        url: url,
      ),
    );
  }
}
