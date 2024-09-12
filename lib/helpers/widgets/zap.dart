import 'package:flutter/material.dart';

class Zap extends StatefulWidget {
  Image frontPicture;
  Image backPicture;

  Zap({super.key, required this.frontPicture, required this.backPicture});

  @override
  _ZapState createState() => _ZapState();
}

class _ZapState extends State<Zap> {
  bool backBig = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 300,
          height: 400,
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
                  child: backBig ? widget.backPicture : widget.frontPicture,
                ),
              ),
              GestureDetector(
                onTap: () {
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
                        child:
                            backBig ? widget.frontPicture : widget.backPicture,
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
