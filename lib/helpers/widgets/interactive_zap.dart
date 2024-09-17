import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyzap/helpers/widgets/size_provider.dart';
import 'package:flutter/material.dart';

class InteractiveZap extends StatefulWidget {
  final Image? frontPicture;
  final Image? backPicture;
  final CachedNetworkImage? frontCachedPicture;
  final CachedNetworkImage? backCachedPicture;
  final double? borderRadius;
  final double defaultBorderRadius = 25;
  final double? padding;
  final double defaultPadding = 10;

  final Function()? onTap;

  const InteractiveZap(
      {super.key,
      this.borderRadius,
      this.frontPicture,
      this.onTap,
      this.backPicture,
      this.padding,
      this.frontCachedPicture,
      this.backCachedPicture});

  @override
  _InteractiveZapState createState() => _InteractiveZapState();
}

class _InteractiveZapState extends State<InteractiveZap> {
  bool backBig = true;
  bool hideUI = false;

  Size? size;
  double padding = 0;
  late double topY;
  late double leftX;
  bool dragging = false;
  late double initX;
  late double initY;

  bool tappingOnSmall = false;

  @override
  void initState() {
    super.initState();
    if (widget.padding != null) {
      padding = widget.padding!;
    } else {
      padding = widget.defaultPadding;
    }
    topY = padding;
    leftX = padding;
  }

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

    double boxWidth = size?.width == null ? 100 : size!.width * 0.3;
    double boxHeight = boxWidth * 4 / 3;

    return Center(
        child: AspectRatio(
            aspectRatio: 3 / 4,
            child: GestureDetector(
                onTap: widget.onTap,
                onTapDown: (_) {
                  if (!tappingOnSmall) {
                    tappingOnSmall = false;
                    setState(() {
                      hideUI = true;
                    });
                  }
                },
                onTapUp: (_) {
                  tappingOnSmall = false;
                  setState(() {
                    hideUI = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    tappingOnSmall = false;
                    dragging = false;
                    hideUI = false;
                  });
                },
                child: SizeProviderWidget(
                  onChildSize: (s) {
                    setState(() {
                      size = s;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        foregroundDecoration: borderBig,
                        decoration: borderBig,
                        child:
                            AspectRatio(aspectRatio: 3 / 4, child: bigPicture),
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
                                  onTapUp: (_) {
                                    tappingOnSmall = false;
                                    setState(() {
                                      hideUI = false;
                                    });
                                  },
                                  onTapCancel: () {
                                    tappingOnSmall = false;
                                    setState(() {
                                      hideUI = false;
                                    });
                                  },
                                  onTapDown: (_) {
                                    tappingOnSmall = true;
                                  },
                                  onPanStart: (DragStartDetails details) {
                                    setState(() {
                                      dragging = true;
                                      initX = details.globalPosition.dx;
                                      initY = details.globalPosition.dy;
                                    });
                                  },
                                  onPanUpdate: (DragUpdateDetails details) {
                                    final dx =
                                        details.globalPosition.dx - initX;
                                    final dy =
                                        details.globalPosition.dy - initY;
                                    initX = details.globalPosition.dx;
                                    initY = details.globalPosition.dy;

                                    final maxX =
                                        size!.width - boxWidth - padding;
                                    final maxY =
                                        size!.height - boxHeight - padding;

                                    setState(() {
                                      topY = (topY + dy).clamp(padding, maxY);
                                      leftX = (leftX + dx).clamp(padding, maxX);
                                    });
                                  },
                                  onPanEnd: (DragEndDetails details) {
                                    setState(() {
                                      hideUI = false;
                                      dragging = false;
                                      if (leftX + boxWidth / 2 <
                                          size!.width / 2) {
                                        leftX = padding;
                                      } else {
                                        leftX =
                                            size!.width - boxWidth - padding;
                                      }
                                      topY = padding;
                                    });
                                  },
                                  onTap: widget.onTap != null
                                      ? null
                                      : () {
                                          setState(() {
                                            dragging = true;
                                            backBig = !backBig;
                                          });
                                        },
                                  child: SizedBox(
                                      width: boxWidth,
                                      height: boxHeight,
                                      child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          foregroundDecoration: borderSmall,
                                          decoration: borderSmall,
                                          child: AspectRatio(
                                              aspectRatio: 3 / 4,
                                              child: smallPicture)))))),
                    ],
                  ),
                ))));
  }
}
