import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bingo_application/screens/gamescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'dart:async';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:bingo_application/screens/gamescreen.dart';

class deathScreen extends StatefulWidget {
  @override
  deathScreenState createState() => deathScreenState();
}

@override
class deathScreenState extends State<deathScreen> {
  final PageController _controller = PageController(initialPage: 1);

  int _currentPage = 1;
  bool end = false;

  double buttonOpac = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 11), (Timer opacTimer) {
      setState(() {
        buttonOpac = 1;
      });
    });
    Future.delayed(Duration(seconds: 9), () {
      if (_currentPage == 0) {
        end = true;
      } else if (_currentPage == 1) {
        end = false;
      }
      if (end == false) {
        _currentPage--;
      } else {
        _currentPage--;
      }
      _controller.animateToPage(_currentPage,
          duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
          body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: [
            Stack(
              children: [
                Container(
                    color: Colors.black,
                    child: Align(
                        alignment: Alignment(0, -0.5),
                        child: Text(
                          'You Died!',
                          style: GoogleFonts.quicksand(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent.shade700,
                          ),
                        ))),
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    height: 900,
                    child: RiveAnimation.asset(
                      'assets/Mingeruchi.riv',
                      artboard: "Blood",
                      alignment: Alignment.center,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, .3),
                  child: AnimatedOpacity(
                    opacity: buttonOpac,
                    duration: const Duration(milliseconds: 500),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashFactory: InkRipple.splashFactory,
                        splashColor: Colors.red.shade700.withOpacity(0.5),
                        highlightColor: Colors.red.shade700.withOpacity(0.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        onTap: () {
                          exit(0);
                        },
                        child: Ink(
                            height: 85,
                            width: 145,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                color: Colors.red.shade400),
                            child: Center(
                              child: Text(
                                'Exit Game',
                                style: GoogleFonts.quicksand(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red.shade900),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  color: Colors.black,
                ),
                Align(
                  alignment: Alignment(0, 0.85),
                  child: Container(
                    color: Colors.blueGrey.shade700,
                    height: 450,
                    child: RiveAnimation.asset(
                      'assets/Mingeruchi.riv',
                      artboard: "Win ",
                      alignment: Alignment.center,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            ),
          ]));
}
