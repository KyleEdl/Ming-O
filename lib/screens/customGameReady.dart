import 'package:bingo_application/modelclass.dart';
import 'package:bingo_application/screens/gamescreenCustom.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bingo_application/screens/gamescreen.dart';
import 'package:bingo_application/screens/gamescreenBAR.dart';
import 'package:get_it/get_it.dart';
import 'package:bingo_application/List/lists.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bingo_application/firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class customReadyScreen extends StatefulWidget {
  const customReadyScreen({Key? key}) : super(key: key);

  @override
  State<customReadyScreen> createState() => customReadyPage();
}

class customReadyPage extends State<customReadyScreen> {
  double buttonOpac = 0;
  double hourGlassOpac = 1;
  bool gameReady = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        buttonOpac = 1;
        hourGlassOpac = 0;
        gameReady = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
              color: Colors.deepPurpleAccent[100],
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment(0, -0.5),
                      child: AnimatedOpacity(
                          opacity: hourGlassOpac,
                          duration: const Duration(seconds: 1),
                          child: Container(
                            width: 150,
                            child: RiveAnimation.asset(
                              'assets/Mingeruchi.riv',
                              artboard: "hourglass",
                              animations: [],
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.center,
                            ),
                          ))),
                  Align(
                      alignment: Alignment(0, -0.5),
                      child: Container(
                        child: Text("Your Game Key is:" /* Zack # 2*/,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.deepPurple[900])),
                      )),
                  Align(
                      alignment: Alignment(0, 0),
                      child: AnimatedOpacity(
                          opacity: buttonOpac,
                          duration: const Duration(seconds: 1),
                          child: ElevatedButton(
                            child: Text('Start Ming-O'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 50),
                              primary: Colors.cyan.shade700,
                            ),
                            onPressed: () {
                              if (gameReady == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            gamescreenCustom())));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.red.shade600,
                                  duration: Duration(seconds: 1),
                                  content: Text(
                                    "Game not ready! Please wait...",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ));
                              }
                            },
                          ))),
                  Align(
                    alignment: Alignment(0, 0.4),
                    child: ElevatedButton(
                      child: Text('Watch Tutorial'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        primary: Colors.red.shade700,
                      ),
                      onPressed: () async {
                        const url = 'https://youtu.be/ofT_HdTAbks';

                        await launch(url);
                      },
                    ),
                  ),
                ],
              )),
        ));
  }
}
