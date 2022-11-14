import 'package:bingo_application/modelclass.dart';
import 'package:bingo_application/screens/gamescreenCustom.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bingo_application/screens/gamescreen.dart';
import 'package:bingo_application/screens/gamescreenBAR.dart';
import 'package:bingo_application/screens/gamescreenFuneral.dart';
import 'package:bingo_application/screens/gamescreenFuneral.dart';
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
import 'package:bingo_application/modelclass.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class funeralReadyScreen extends StatefulWidget {
  const funeralReadyScreen({Key? key}) : super(key: key);

  @override
  State<funeralReadyScreen> createState() => funeralReadyPage();
}

class funeralReadyPage extends State<funeralReadyScreen> {
  double buttonOpac = 0;
  double hourGlassOpac = 1;
  static String gameKey = "";
  FirstPage fs = new FirstPage();
  bool gameReady = false;
  static List tileAssignment = List.filled(25, "");
  static List shownDescriptions = List.filled(25, '');
  final FirstPage fp = new FirstPage();
  int r = 0;
  int cou = 0;
  var gl = null;
  ModelClass modelClass = GetIt.instance.get<ModelClass>();
  final firebaseInit = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var ranNum = new Random();
  @override
  void initState() {
    super.initState();
    fp.setisFuneral = true;
    gl = new gameList(fp.getisLaura, fp.getisOma, fp.getisEdl, fp.getisRoth,
        fp.getisFuneral, fp.getisBar, fp.getisParty, fp.getisUniversal);
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        buttonOpac = 1;
        hourGlassOpac = 0;
        gameReady = true;
      });
    });
  }

  get gettileAssignment {
    return tileAssignment;
  }

  get getshownDescriptions {
    return shownDescriptions;
  }

  get getgameKey {
    return gameKey;
  }

  Future joinedGame() async {
    await firebaseInit;

    String name = modelClass.value;

    final refMessage =
        FirebaseFirestore.instance.collection('messages').doc(gameKey);
    refMessage.set({'GAME KEY': gameKey});

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc(gameKey)
        .collection(gameKey)
        .doc('ADMIN: $name Has Joined The Game');
    await refMessages.set({
      'username': 'ADMIN',
      'message': 'ADMIN: $name Has Joined The Game',
      'created': DateTime.now()
    });
  }

  Widget build(BuildContext context) {
    if (fs.getgameKey == "") {
      gameKey = fs.getgameKeySet;
    } else {
      gameKey = fs.getgameKey.toString();
    }
    tileAssignment = gl.tileAssignment;
    shownDescriptions = gl.shownDescriptions;

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
                        child: Text("Your Game Key is: $gameKey" /* Zack # 2*/,
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
                                joinedGame();
                                Future.delayed(Duration(seconds: 3), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              gamescreenFuneral())));
                                });
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
