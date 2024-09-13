import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class InteractiveZap extends StatefulWidget {
  final Image? frontPicture;
  final Image? backPicture;
  final FastCachedImage? frontCachedPicture;
  final FastCachedImage? backCachedPicture;
  final double width;

  final Function()? onTap;

  const InteractiveZap(
      {super.key,
      this.frontPicture,
      this.onTap,
      this.backPicture,
      required this.width,
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

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: widget.onTap,
          onLongPress: widget.onTap != null
              ? null
              : () {
                  setState(() {
                    hideUI = true;
                  });
                },
          onLongPressEnd: widget.onTap != null
              ? null
              : (details) {
                  setState(() {
                    hideUI = false;
                  });
                },
          child: SizedBox(
            width: widget.width,
            height: widget.width * 3 / 4,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: bigPicture,
                  ),
                ),
                if (!hideUI)
                  GestureDetector(
                      onTap: widget.onTap != null
                          ? null
                          : () {
                              setState(() {
                                backBig = !backBig;
                              });
                            },
                      child: FractionallySizedBox(
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: smallPicture,
                              )))),
              ],
            ),
          ),
        ));
  }
}
