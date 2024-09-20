import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/widgets/interactive_zap.dart';
import 'package:dailyzap_api/api.dart';
import 'package:flutter/material.dart';

class NetworkZap extends StatefulWidget {
  final Zap zap;
  final double? borderRadius;
  final double? padding;
  final Function()? onTap;
  final Function(bool)? onParentGesturesShouldBeEnabled;
  final bool blurred = false;

  const NetworkZap(
      {super.key,
      required this.zap,
      this.onTap,
      this.onParentGesturesShouldBeEnabled,
      this.borderRadius,
      this.padding});

  @override
  _NetworkZapState createState() => _NetworkZapState();
}

class _NetworkZapState extends State<NetworkZap> {
  @override
  Widget build(BuildContext context) {
    final zap = InteractiveZap(
        onParentGesturesShouldBeEnabled:
            widget.blurred ? null : widget.onParentGesturesShouldBeEnabled,
        borderRadius: widget.borderRadius,
        padding: widget.padding,
        onTap: widget.blurred ? () {} : widget.onTap,
        frontCachedPicture: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: widget.zap.frontCameraUrl,
            fadeInDuration: const Duration(milliseconds: 0),
            httpHeaders: getAuthHeader(),
            key: ValueKey(widget.zap.frontCameraUrl)),
        backCachedPicture: CachedNetworkImage(
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 0),
            imageUrl: widget.zap.backCameraUrl,
            httpHeaders: getAuthHeader(),
            key: ValueKey(widget.zap.backCameraUrl)));
    return widget.blurred
        ? Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: zap)),
              Center(
                  child: TextButton(
                      onPressed: () {
                        navigateNewSubPage("/capture");
                      },
                      child: const Text("Capture")))
            ],
          )
        : zap;
  }
}
