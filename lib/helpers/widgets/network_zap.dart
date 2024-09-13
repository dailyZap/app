import 'package:dailyzap/helpers/widgets/interactive_zap.dart';
import 'package:dailyzap_api/api.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkZap extends StatefulWidget {
  final Zap zap;
  final double width;
  final Function()? onTap;

  const NetworkZap(
      {super.key, required this.zap, required this.width, this.onTap});

  @override
  _NetworkZapState createState() => _NetworkZapState();
}

class _NetworkZapState extends State<NetworkZap> {
  @override
  Widget build(BuildContext context) {
    return InteractiveZap(
        onTap: widget.onTap,
        width: widget.width,
        frontCachedPicture: FastCachedImage(
            url: widget.zap.frontCameraUrl,
            fadeInDuration: const Duration(milliseconds: 0),
            key: Key(widget.zap.frontCameraUrl)),
        backCachedPicture: FastCachedImage(
            fadeInDuration: const Duration(milliseconds: 0),
            url: widget.zap.backCameraUrl,
            key: Key(widget.zap.backCameraUrl)));
  }
}
