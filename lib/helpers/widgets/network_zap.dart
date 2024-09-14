import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/widgets/interactive_zap.dart';
import 'package:dailyzap_api/api.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkZap extends StatefulWidget {
  final Zap zap;
  final double? borderRadius;
  final Function()? onTap;

  const NetworkZap(
      {super.key, required this.zap, this.onTap, this.borderRadius});

  @override
  _NetworkZapState createState() => _NetworkZapState();
}

class _NetworkZapState extends State<NetworkZap> {
  @override
  Widget build(BuildContext context) {
    return InteractiveZap(
        borderRadius: widget.borderRadius,
        onTap: widget.onTap,
        frontCachedPicture: FastCachedImage(
            fit: BoxFit.cover,
            url: widget.zap.frontCameraUrl,
            fadeInDuration: const Duration(milliseconds: 0),
            headers: getAuthHeader(),
            key: Key(widget.zap.frontCameraUrl)),
        backCachedPicture: FastCachedImage(
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 0),
            url: widget.zap.backCameraUrl,
            headers: getAuthHeader(),
            key: Key(widget.zap.backCameraUrl)));
  }
}
