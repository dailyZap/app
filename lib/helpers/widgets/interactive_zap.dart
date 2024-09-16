import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InteractiveZap extends StatefulWidget {
  final Image? frontPicture;
  final Image? backPicture;
  final CachedNetworkImage? frontCachedPicture;
  final CachedNetworkImage? backCachedPicture;
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

  double topY = 20;
  double leftX = 20;
  bool dragging = false;
  late double initX;
  late double initY;

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
              // onTap: widget.onTap,
              // onTapDown: widget.onTap != null
              //     ? null
              //     : (_) {
              //         setState(() {
              //           hideUI = true;
              //         });
              //       },
              // onTapUp: widget.onTap != null
              //     ? null
              //     : (details) {
              //         setState(() {
              //           hideUI = false;
              //         });
              //       },
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    foregroundDecoration: borderBig,
                    decoration: borderBig,
                    child: AspectRatio(aspectRatio: 3 / 4, child: bigPicture),
                  ),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: dragging ? 0 : 200),
                      curve: Curves.easeInOut,
                      left: leftX,
                      top: topY,
                      child: AnimatedOpacity(
                          opacity: hideUI ? 0 : 1,
                          duration: const Duration(milliseconds: 200),
                          child: GestureDetector(
                              onPanStart: (DragStartDetails details) {
                                setState(() {
                                  dragging = true;
                                  initX = details.globalPosition.dx;
                                  initY = details.globalPosition.dy;
                                });
                                print("Start: $initX, $initY");
                              },
                              onPanUpdate: (DragUpdateDetails details) {
                                final dx = details.globalPosition.dx - initX;
                                final dy = details.globalPosition.dy - initY;
                                initX = details.globalPosition.dx;
                                initY = details.globalPosition.dy;
                                setState(() {
                                  topY =
                                      (topY + dy).clamp(0.0, double.infinity);
                                  leftX =
                                      (leftX + dx).clamp(0.0, double.infinity);
                                });
                              },
                              onPanEnd: (DragEndDetails details) {
                                setState(() {
                                  dragging = false;
                                  topY = 0;
                                  leftX = 0;
                                });
                              },
                              // onTap: widget.onTap != null
                              //     ? null
                              //     : () {
                              //         setState(() {
                              //           backBig = !backBig;
                              //         });
                              //       },
                              child: SizedBox(
                                  width: 100,
                                  height: 100 * 4 / 3,
                                  child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      foregroundDecoration: borderSmall,
                                      decoration: borderSmall,
                                      child: AspectRatio(
                                          aspectRatio: 3 / 4,
                                          child: smallPicture)))))),
                ],
              ),
            )));
  }
}
