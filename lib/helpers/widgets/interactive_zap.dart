import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class InteractiveZap extends StatefulWidget {
  final Image? frontPicture;
  final Image? backPicture;
  final FastCachedImage? frontCachedPicture;
  final FastCachedImage? backCachedPicture;
  final double? borderRadius;
  final double defaultBorderRadius = 25;

  final Function()? onTap;

  const InteractiveZap(
      {super.key,
      this.borderRadius,
      this.frontPicture,
      this.onTap,
      this.backPicture,
      this.frontCachedPicture,
      this.backCachedPicture});

  @override
  _InteractiveZapState createState() => _InteractiveZapState();
}

class _InteractiveZapState extends State<InteractiveZap> {
  bool backBig = true;
  bool hideUI = false;

  @override
  Widget build(BuildContext context) {
    final bigPicture = backBig
        ? widget.backPicture ?? widget.backCachedPicture
        : widget.frontPicture ?? widget.frontCachedPicture;
    final smallPicture = backBig
        ? widget.frontPicture ?? widget.frontCachedPicture
        : widget.backPicture ?? widget.backCachedPicture;

    final borderSmall = BoxDecoration(
      border: Border.all(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(
        (widget.borderRadius ?? widget.defaultBorderRadius) * 0.6,
      ),
    );
    final borderBig = BoxDecoration(
      border: Border.all(
        color: Colors.black,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(
        (widget.borderRadius ?? widget.defaultBorderRadius),
      ),
    );

    return Center(
        child: AspectRatio(
            aspectRatio: 3 / 4,
            child: GestureDetector(
              onTap: widget.onTap,
              onTapDown: widget.onTap != null
                  ? null
                  : (_) {
                      setState(() {
                        hideUI = true;
                      });
                    },
              onTapUp: widget.onTap != null
                  ? null
                  : (details) {
                      setState(() {
                        hideUI = false;
                      });
                    },
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    foregroundDecoration: borderBig,
                    decoration: borderBig,
                    child: AspectRatio(aspectRatio: 3 / 4, child: bigPicture),
                  ),
                  AnimatedOpacity(
                      opacity: hideUI ? 0 : 1,
                      duration: const Duration(milliseconds: 200),
                      child: GestureDetector(
                          onTap: widget.onTap != null
                              ? null
                              : () {
                                  setState(() {
                                    backBig = !backBig;
                                  });
                                },
                          child: FractionallySizedBox(
                              widthFactor: 0.35,
                              heightFactor: 0.35,
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    foregroundDecoration: borderSmall,
                                    decoration: borderSmall,
                                    child: AspectRatio(
                                        aspectRatio: 3 / 4,
                                        child: smallPicture),
                                  ))))),
                ],
              ),
            )));
  }
}
