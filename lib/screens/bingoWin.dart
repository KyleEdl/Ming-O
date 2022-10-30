import 'dart:io';

import 'package:flutter/material.dart';
import 'package:bingo_application/screens/gamescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'dart:async';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:ffi';
import 'dart:convert';
import 'package:grouped_list/grouped_list.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:bingo_application/List/lists.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'package:bingo_application/screens/bingoWin.dart';
import 'package:bingo_application/screens/bingoDie.dart';
import 'package:bingo_application/screens/bingoLost.dart';
import 'package:bingo_application/modelclass.dart';
import 'package:bingo_application/main.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:bingo_application/panel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bingo_application/firebase_options.dart';
import 'package:bingo_application/screens/messages.dart';
import 'package:vibration/vibration.dart';
import 'package:bingo_application/screens/gamescreen.dart';

class winScreen extends StatefulWidget {
  @override
  winScreenState createState() => winScreenState();
}

@override
class winScreenState extends State<winScreen> {
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
                    color: Color.fromARGB(255, 35, 135, 236),
                    child: Align(
                        alignment: Alignment(0, -0.5),
                        child: GradientText('Ming-O!',
                            style: GoogleFonts.quicksand(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                            ),
                            colors: [
                              Color.fromARGB(255, 1, 190, 80),
                              Color.fromARGB(255, 0, 200, 83),
                              Color.fromARGB(255, 0, 230, 119),
                              Color.fromARGB(255, 105, 240, 175),
                            ]))),
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    height: 900,
                    child: RiveAnimation.asset(
                      'assets/Mingeruchi.riv',
                      artboard: "confetti",
                      alignment: Alignment.center,
                      fit: BoxFit.fitHeight,
                      stateMachines: ['Layer 2'],
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
                  color: Color.fromARGB(255, 35, 135, 236),
                ),
                Align(
                  alignment: Alignment(0, 0.85),
                  child: Container(
                    color: Color.fromARGB(255, 35, 135, 236),
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
