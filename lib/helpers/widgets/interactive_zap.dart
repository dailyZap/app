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

  final Function(bool)? onParentGesturesShouldBeEnabled;

  const InteractiveZap(
      {super.key,
      this.borderRadius,
      this.frontPicture,
      this.onTap,
      this.backPicture,
      this.padding,
      this.onParentGesturesShouldBeEnabled,
      this.frontCachedPicture,
      this.backCachedPicture});

  @override
  _InteractiveZapState createState() => _InteractiveZapState();
}

class _InteractiveZapState extends State<InteractiveZap>
    with TickerProviderStateMixin {
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

  final TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4>? _animationReset;
  AnimationController? _controllerReset;

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    if (widget.padding != null) {
      padding = widget.padding!;
    } else {
      padding = widget.defaultPadding;
    }
    topY = padding;
    leftX = padding;
  }

  @override
  void dispose() {
    _controllerReset?.dispose();
    super.dispose();
  }

  int downPointers = 0;

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
            child: Listener(
                onPointerDown: (e) {
                  downPointers++;
                  if (downPointers > 1) {
                    setGesturesEnabled(false);
                  }
                },
                onPointerCancel: (e) {
                  downPointers--;
                  if (downPointers == 0) {
                    setGesturesEnabled(true);
                  }
                },
                onPointerUp: (e) {
                  downPointers--;
                  if (downPointers == 0) {
                    setGesturesEnabled(true);
                  }
                },
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
                            child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: InteractiveViewer(
                                    transformationController:
                                        _transformationController,
                                    minScale: 1.0,
                                    maxScale: 2.5,
                                    onInteractionStart: (details) {
                                      _onInteractionStart(details);
                                    },
                                    onInteractionEnd: (details) {
                                      _onInteractionEnd(details);
                                    },
                                    child: bigPicture!)),
                          ),
                          AnimatedPositioned(
                              duration:
                                  Duration(milliseconds: dragging ? 0 : 200),
                              curve: Curves.easeInOut,
                              left: leftX,
                              top: topY,
                              child: AnimatedOpacity(
                                  opacity: hideUI ? 0 : 1,
                                  duration: const Duration(milliseconds: 200),
                                  child: GestureDetector(
                                      onTapUp: (_) {
                                        setGesturesEnabled(true);
                                        tappingOnSmall = false;
                                        setState(() {
                                          hideUI = false;
                                        });
                                      },
                                      onTapCancel: () {
                                        setGesturesEnabled(true);
                                        tappingOnSmall = false;
                                        setState(() {
                                          hideUI = false;
                                        });
                                      },
                                      onTapDown: (_) {
                                        setGesturesEnabled(false);
                                        tappingOnSmall = true;
                                      },
                                      onPanStart: (DragStartDetails details) {
                                        setGesturesEnabled(false);
                                        setState(() {
                                          dragging = true;
                                          initX = details.globalPosition.dx;
                                          initY = details.globalPosition.dy;
                                        });
                                      },
                                      onPanUpdate: (DragUpdateDetails details) {
                                        setGesturesEnabled(false);
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
                                          topY =
                                              (topY + dy).clamp(padding, maxY);
                                          leftX =
                                              (leftX + dx).clamp(padding, maxX);
                                        });
                                      },
                                      onPanEnd: (DragEndDetails details) {
                                        setGesturesEnabled(true);
                                        setState(() {
                                          hideUI = false;
                                          dragging = false;
                                          if (leftX + boxWidth / 2 <
                                              size!.width / 2) {
                                            leftX = padding;
                                          } else {
                                            leftX = size!.width -
                                                boxWidth -
                                                padding;
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
                    )))));
  }

  void _onAnimateReset() {
    if (_animationReset == null || _controllerReset == null) {
      return;
    }
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset!.isAnimating) {
      _animationReset?.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset!.reset();
    }
  }

  void _animateResetInitialize() {
    if (_controllerReset == null || _animationReset != null) {
      return;
    }
    _controllerReset!.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset!);
    _animationReset!.addListener(_onAnimateReset);
    _controllerReset!.forward();
  }

// Stop a running reset to home transform animation.
  void _animateResetStop() {
    if (_controllerReset == null || _animationReset == null) {
      return;
    }
    _controllerReset!.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset!.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    setGesturesEnabled(false);
    setState(() {
      hideUI = true;
    });
    if (_controllerReset!.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  void _onInteractionEnd(ScaleEndDetails details) {
    setGesturesEnabled(true);
    setState(() {
      hideUI = false;
    });
    _animateResetInitialize();
  }

  void setGesturesEnabled(bool enabled) {
    if (widget.onParentGesturesShouldBeEnabled != null) {
      widget.onParentGesturesShouldBeEnabled!(enabled);
    }
  }
}
