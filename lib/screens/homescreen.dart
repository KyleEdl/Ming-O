import 'package:bingo_application/modelclass.dart';
import 'package:bingo_application/screens/customGame.dart';
import 'package:bingo_application/screens/customGameReady.dart';
import 'package:bingo_application/screens/barGameReady.dart';
import 'package:bingo_application/screens/funeralGameReady.dart';
import 'package:bingo_application/screens/partyGameReady.dart';

import 'package:bingo_application/screens/gamescreenFuneral.dart';
import 'package:bingo_application/screens/gamescreenPARTY.dart';
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
import 'dart:math';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => FirstPage();
}

class FirstPage extends State<FirstScreen> {
  final textController = TextEditingController();
  final textControllerKey = TextEditingController();
  // List bools
  static bool? isLaura = false;
  static bool? isOma = false;
  static bool? isEdl = false;
  static bool? isRoth = false;
  static bool? isFuneral = false;
  static bool? isBar = false;
  static bool? isParty = false;
  static List tileAssignment = [];
  static List shownDescriptions = [];
  static String gameMode = '';
  static bool? isUniversal = false;
  static bool? isCustom = false;
  static bool? docExists = false;
  static String gameKey = "";
  static int customKey = (Random().nextInt(100000) + 10000);
  static String gameKeySet = customKey.toString();
  static bool nextButtonActive = false;
  double mingOpac = 1;
  double nextGreenOpac = 0;

  // static String myName = "";
  // static String myAbilName = "";
  // @override
  void initState() {
    super.initState();

    KeyboardVisibilityController().onChange.listen((isVisible) {
      isVisible
          ? setState(() {
              mingOpac = 0;
            })
          : setState(() {
              mingOpac = 1;
            });
    });
  }

  final firebaseInit = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  get getisLaura {
    return isLaura;
  }

  get getisOma {
    return isOma;
  }

  get getisEdl {
    return isEdl;
  }

  get getisRoth {
    return isRoth;
  }

  get getcustomKey {
    return customKey;
  }

  get getgameKeySet {
    return gameKeySet;
  }

  get getgameMode {
    return gameMode;
  }

  get getisFuneral {
    return isFuneral;
  }

  get getisBar {
    return isBar;
  }

  get getisParty {
    return isParty;
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

  get getisUniversal {
    return isUniversal;
  }

  FirstPage();
  set setisLaura(bool? isL) {
    isLaura = isL;
  }

  set setisOma(bool? isO) {
    isOma = isO;
  }

  set setisEdl(bool? isE) {
    isEdl = isE;
  }

  set setisRoth(bool? isR) {
    isRoth = isR;
  }

  set setisFuneral(bool? isF) {
    isFuneral = isF;
  }

  set setisParty(bool? isP) {
    isParty = isP;
  }

  set setisBar(bool? isB) {
    isBar = isB;
  }

  set setisUniversal(bool? isU) {
    isUniversal = isU;
  }

  Future joinedGame() async {
    await firebaseInit;

    String name = modelClass.value;

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc(gameMode)
        .collection(gameMode)
        .doc('*** $name Has Joined The Game ***');
    await refMessages.set({
      'username': 'ADMIN',
      'message': '*** $name Has Joined The Game ***',
      'created': DateTime.now()
    });
  }

  // Future abilityInit() async {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // }

//launches the tutorial
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future customDocFind(String docID) async {
    if (docID.contains('BAR') ||
        docID.contains('PARTY') ||
        docID.contains('FUNERAL')) {
      final refMessages =
          await FirebaseFirestore.instance.collection('messages').doc(docID);
      final doc = await refMessages.get();

      if (doc.exists) {
        docExists = true;
      }

      if (!doc.exists) {
        docExists = false;
      }
    } else {
      final refMessages =
          await FirebaseFirestore.instance.collection('CUSTOM').doc(docID);
      final doc = await refMessages.get();
      print(doc);
      if (doc.exists) {
        docExists = true;
        print(doc.exists);
        print(docExists);
        print(docID);
      }
      if (!doc.exists) {
        docExists = false;
        print(doc.exists);
        print(docExists);
        print(docID);
      }
    }
  }

//store name
  ModelClass modelClass = GetIt.instance.get<ModelClass>();

  //controller to keep track of the page we're on
  final PageController _controller = PageController();

  //Submit Button is pressed
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        mingOpac = 1;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                // Page 1
                Listener(
                  onPointerMove: (moveEvent) {
                    if (moveEvent.delta.dx < 0) {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    color: Colors.cyan,
                    child: Stack(children: <Widget>[
                      Align(
                          alignment: Alignment(0, -0.5),
                          child: Container(
                            child: Text("Welcome to Ming-O!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                    color: Colors.cyan[900])),
                          )),
                      Align(
                        alignment: Alignment(0, .8),
                        child: Container(
                          height: 550,
                          width: 650,
                          child: RiveAnimation.asset(
                            'assets/Mingeruchi.riv',
                            artboard: "Wave",
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),

                //Page 2
//PageView(physics: NeverScrollableScrollPhysics()),
                Container(
                  color: Colors.greenAccent,
                  child: Stack(children: <Widget>[
                    Align(
                        alignment: Alignment(0, -0.65),
                        child: Container(
                          child: Text("Let's start with your name...",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.green[800])),
                        )),
                    Align(
                      alignment: Alignment(0, -0.15),
                      child: GestureDetector(
                        onTap: () {},
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(12),
                          ],
                          controller: textController,
                          decoration: InputDecoration(
                              labelText: 'Type name here (required)',
                              labelStyle: TextStyle(
                                color: Colors.green[700],
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  modelClass.value = textController.text;

                                  if (textController.text.isNotEmpty &&
                                      !textController.text.contains('*** ') &&
                                      !textController.text.contains(' ***')) {
                                    _controller.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  }
                                  if (textController.text.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red.shade600,
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                        'Please enter name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ));
                                  }

                                  if (textController.text.contains('*** ') ||
                                      textController.text.contains(' ***')) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red.shade600,
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                        'Name cannot contain "***"',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ));
                                  }
                                },
                                icon: const Icon(Icons.send),
                              )),
                          textInputAction: TextInputAction.go,
                          onSubmitted: (value) {
                            modelClass.value = textController.text;
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.9),
                      child: AnimatedOpacity(
                        opacity: mingOpac,
                        duration: const Duration(milliseconds: 250),
                        child: Container(
                          height: 350,
                          width: 450,
                          child: RiveAnimation.asset(
                            'assets/Mingeruchi.riv',
                            artboard: "Notes",
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                  ]),
                ),

                //Page 3
                Listener(
                  onPointerMove: (moveEvent) {
                    if (moveEvent.delta.dx > 0) {
                      _controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    color: Colors.pink[300],
                    child: Stack(children: <Widget>[
                      Align(
                          alignment: Alignment(0, -0.7),
                          child: Container(
                            child: Text("Select an option",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.pink[900])),
                          )),
                      Align(
                        alignment: Alignment(0, -0.2),
                        child: GestureDetector(
                          onTap: () {
                            if (textController.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red.shade600,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'Please enter name',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ));
                            }
                            if (textController.text.isNotEmpty) {
                              showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32))),
                                      backgroundColor: Colors.pink[300],
                                      title: Center(
                                        child: Text(
                                          'Select a Featured Mode',
                                          style: GoogleFonts.quicksand(
                                              color: Colors.pink[700],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      content: StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Stack(children: [
                                          Align(
                                              alignment: Alignment(0, -0.8),
                                              child: CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                value: isFuneral,
                                                onChanged: (bool? funeral) {
                                                  nextButtonActive =
                                                      !nextButtonActive;

                                                  setState(() {
                                                    isEdl = false;
                                                    isOma = false;
                                                    isLaura = false;
                                                    isRoth = false;
                                                    isFuneral = funeral;
                                                    isBar = false;
                                                    isParty = false;
                                                  });
                                                  gameMode = 'funeral';
                                                  if (isBar == true) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red.shade600,
                                                      duration:
                                                          Duration(seconds: 1),
                                                      content: Text(
                                                        "Cannot check while Bar Mode is active",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ));
                                                  }
                                                  if (isParty == true) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red.shade600,
                                                      duration:
                                                          Duration(seconds: 1),
                                                      content: Text(
                                                        "Cannot check while Party Mode is active",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ));
                                                  }
                                                  if (nextButtonActive ==
                                                      true) {
                                                    nextGreenOpac = 0.8;
                                                  } else if (nextButtonActive ==
                                                      false) {
                                                    nextGreenOpac = 0;
                                                  }
                                                },
                                                activeColor:
                                                    Colors.green.shade200,
                                                title: Text(
                                                  'Funeral Mode',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red[900]),
                                                ),
                                                subtitle: Text(
                                                    'If you are attending a funeral, click this.'),
                                              )),
                                          Align(
                                              alignment: Alignment(0, -0.5),
                                              child: CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                value: isBar,
                                                onChanged: (bool? bar) {
                                                  nextButtonActive =
                                                      !nextButtonActive;
                                                  setState(() {
                                                    isEdl = false;
                                                    isOma = false;
                                                    isLaura = false;
                                                    isRoth = false;
                                                    isFuneral = false;
                                                    isBar = bar;
                                                    isParty = false;
                                                  });
                                                  gameMode = 'bar';
                                                  if (isFuneral == true) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red.shade600,
                                                      duration:
                                                          Duration(seconds: 1),
                                                      content: Text(
                                                        "Cannot check while Funeral Mode is active",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ));
                                                  }

                                                  if (isParty == true) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red.shade600,
                                                      duration:
                                                          Duration(seconds: 1),
                                                      content: Text(
                                                        "Cannot check while Party Mode is active",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ));
                                                  }
                                                  if (nextButtonActive ==
                                                      true) {
                                                    nextGreenOpac = 0.8;
                                                  } else if (nextButtonActive ==
                                                      false) {
                                                    nextGreenOpac = 0;
                                                  }
                                                },
                                                activeColor:
                                                    Colors.green.shade200,
                                                title: Text(
                                                  'Bar Mode',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.yellow[700]),
                                                ),
                                                subtitle: Text(
                                                    'If you are at the bar, click this.'),
                                              )),
                                          Align(
                                              alignment: Alignment(0, -0.2),
                                              child: CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                value: isParty,
                                                onChanged: (bool? party) {
                                                  nextButtonActive =
                                                      !nextButtonActive;
                                                  setState(() {
                                                    isEdl = false;
                                                    isOma = false;
                                                    isLaura = false;
                                                    isRoth = false;
                                                    isFuneral = false;
                                                    isBar = false;
                                                    isParty = party;
                                                  });
                                                  gameMode = 'party';
                                                  if (isFuneral == true) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red.shade600,
                                                      duration:
                                                          Duration(seconds: 1),
                                                      content: Text(
                                                        "Cannot check while Funeral Mode is active",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ));
                                                  }
                                                  if (isBar == true) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red.shade600,
                                                      duration:
                                                          Duration(seconds: 1),
                                                      content: Text(
                                                        "Cannot check while Bar Mode is active",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ));
                                                  }
                                                  if (nextButtonActive ==
                                                      true) {
                                                    nextGreenOpac = 0.8;
                                                  } else if (nextButtonActive ==
                                                      false) {
                                                    nextGreenOpac = 0;
                                                  }
                                                },
                                                activeColor:
                                                    Colors.green.shade200,
                                                title: GradientText(
                                                    'Party Mode',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                    gradientType:
                                                        GradientType.linear,
                                                    gradientDirection:
                                                        GradientDirection.ltr,
                                                    colors: [
                                                      Colors.red.shade700,
                                                      Colors.pink,
                                                      Colors.purple,
                                                      Colors.deepPurple,
                                                      Colors.deepPurple,
                                                      Colors.indigo,
                                                      Colors.teal,
                                                      Colors.green,
                                                      Colors.orange,
                                                      Colors.deepOrange,
                                                    ]),
                                                subtitle: Text(
                                                    'If you are at a party, click this.'),
                                              )),
                                          Align(
                                            alignment: Alignment(0, 0.275),
                                            child: Text(
                                              'Or',
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.pink[700],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(0, .7),
                                            child: GestureDetector(
                                              onTap: () {
                                                if (textController
                                                    .text.isEmpty) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        Colors.red.shade600,
                                                    duration:
                                                        Duration(seconds: 1),
                                                    content: Text(
                                                      'Username is required to continue...',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ));
                                                }
                                                if (textController.text
                                                        .contains('*** ') ||
                                                    textController.text
                                                        .contains(' ***')) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        Colors.red.shade600,
                                                    duration:
                                                        Duration(seconds: 1),
                                                    content: Text(
                                                      'Name cannot contain "***"',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ));
                                                }
                                                if (textController
                                                    .text.isNotEmpty) {
                                                  setState(() {
                                                    isEdl = false;
                                                    isOma = false;
                                                    isLaura = false;
                                                    isRoth = false;
                                                    isFuneral = false;
                                                    isBar = false;
                                                    isParty = false;
                                                    isCustom = true;
                                                  });
                                                  if (isCustom == true) {
                                                    gameMode =
                                                        customKey.toString();
                                                  }
                                                  Navigator.push(
                                                      context,
                                                      new MaterialPageRoute(
                                                          builder: (context) =>
                                                              customScreen())).then(
                                                      (value) => setState(
                                                            () {},
                                                          ));
                                                }
                                              },
                                              child: Container(
                                                height: 80,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(20.0),
                                                  ),
                                                  color: Colors.pink.shade700,
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  'Create Custom',
                                                  style: GoogleFonts.quicksand(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                )),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(.0, .05),
                                            child: AnimatedOpacity(
                                              opacity: nextGreenOpac,
                                              duration: const Duration(
                                                  milliseconds: 250),
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (isBar == true ||
                                                      textControllerKey.text
                                                          .contains('BAR')) {
                                                    gameKeySet = "BAR" +
                                                        (Random().nextInt(
                                                                    1000) +
                                                                100)
                                                            .toString();

                                                    isBar = true;
                                                    gameList gl = new gameList(
                                                        isLaura,
                                                        isOma,
                                                        isEdl,
                                                        isRoth,
                                                        isFuneral,
                                                        isBar,
                                                        isParty,
                                                        isUniversal);
                                                    tileAssignment =
                                                        gl.tileAssignment;
                                                    shownDescriptions =
                                                        gl.shownDescriptions;
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                barReadyScreen())));
                                                  }
                                                  if (isFuneral == true ||
                                                      textControllerKey.text
                                                          .contains(
                                                              'FUNERAL')) {
                                                    gameKeySet = "FUNERAL" +
                                                        (Random().nextInt(
                                                                    1000) +
                                                                100)
                                                            .toString();
                                                    isFuneral = true;
                                                    gameList gl = new gameList(
                                                        isLaura,
                                                        isOma,
                                                        isEdl,
                                                        isRoth,
                                                        isFuneral,
                                                        isBar,
                                                        isParty,
                                                        isUniversal);
                                                    tileAssignment =
                                                        gl.tileAssignment;
                                                    shownDescriptions =
                                                        gl.shownDescriptions;
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                funeralReadyScreen())));
                                                  }
                                                  if (isParty == true ||
                                                      textControllerKey.text
                                                          .contains('PARTY')) {
                                                    gameKeySet = "PARTY" +
                                                        (Random().nextInt(
                                                                    1000) +
                                                                100)
                                                            .toString();
                                                    isParty = true;
                                                    gameList gl = new gameList(
                                                        isLaura,
                                                        isOma,
                                                        isEdl,
                                                        isRoth,
                                                        isFuneral,
                                                        isBar,
                                                        isParty,
                                                        isUniversal);
                                                    tileAssignment =
                                                        gl.tileAssignment;
                                                    shownDescriptions =
                                                        gl.shownDescriptions;
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: ((context) =>
                                                                partyReadyScreen())));
                                                  }
                                                },
                                                child: Container(
                                                  height: 60,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .greenAccent.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              75)),
                                                  child: Center(
                                                      child: Text(
                                                    'Next',
                                                    style:
                                                        GoogleFonts.quicksand(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            color: Colors.green
                                                                .shade900),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]);
                                      }))));
                            }
                          },
                          child: Container(
                            height: 80,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: Colors.pink.shade700,
                            ),
                            child: Center(
                                child: Text(
                              'Host Game',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.3),
                        child: GestureDetector(
                          onTap: () {
                            if (textController.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red.shade600,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'Please enter name',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ));
                            }
                            if (textController.text.isNotEmpty) {
                              showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32))),
                                      backgroundColor: Colors.pink[300],
                                      title: Center(
                                        child: Text(
                                          'Join Game',
                                          style: GoogleFonts.quicksand(
                                              color: Colors.pink[700],
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      content: StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return TextField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                12),
                                          ],
                                          controller: textControllerKey,
                                          decoration: InputDecoration(
                                              labelText: 'Custom Key',
                                              labelStyle: TextStyle(
                                                color: Colors.pink[900],
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  FocusScopeNode currentFocus =
                                                      FocusScope.of(context);

                                                  //Zack # 1
                                                  if (textControllerKey
                                                      .text.isNotEmpty) {
                                                    gameKey =
                                                        textControllerKey.text;
                                                    customDocFind(
                                                        textControllerKey.text);
                                                    Future.delayed(
                                                        Duration(seconds: 1),
                                                        () {
                                                      if (docExists == false) {
                                                        textControllerKey
                                                            .clear();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          backgroundColor:
                                                              Colors
                                                                  .red.shade600,
                                                          duration: Duration(
                                                              seconds: 1),
                                                          content: Text(
                                                            "KEY DOES NOT EXIST!",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ));
                                                      } else {
                                                        if (textControllerKey
                                                            .text
                                                            .contains('BAR')) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      ((context) =>
                                                                          barReadyScreen())));
                                                        }
                                                        if (textControllerKey
                                                            .text
                                                            .contains(
                                                                'PARTY')) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      ((context) =>
                                                                          partyReadyScreen())));
                                                        }
                                                        if (textControllerKey
                                                            .text
                                                            .contains(
                                                                'FUNERAL')) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      ((context) =>
                                                                          funeralReadyScreen())));
                                                        }
                                                        if (!textControllerKey
                                                                .text
                                                                .contains(
                                                                    'FUNERAL') &&
                                                            !textControllerKey
                                                                .text
                                                                .contains(
                                                                    'PARTY') &&
                                                            !textControllerKey
                                                                .text
                                                                .contains(
                                                                    'BAR')) {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      ((context) =>
                                                                          customReadyScreen())));
                                                        }
                                                      }
                                                    });
                                                  }

                                                  if (textControllerKey.text
                                                      .contains('AERFAMILY')) {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();

                                                    setState(() {
                                                      isFuneral = false;
                                                      isBar = false;
                                                      isParty = false;
                                                      isUniversal = true;
                                                    });
                                                    gameMode = 'AERFAMILY';
                                                    showDialog(
                                                        context: context,
                                                        builder: ((context) =>
                                                            AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            32))),
                                                                backgroundColor:
                                                                    Colors.pink[
                                                                        300],
                                                                title: Text(
                                                                  'Family Gathering Mode',
                                                                  style: GoogleFonts.quicksand(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                content: StatefulBuilder(builder:
                                                                    (BuildContext
                                                                            context,
                                                                        StateSetter
                                                                            setState) {
                                                                  return Stack(
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment(
                                                                              0,
                                                                              -0.9),
                                                                          child:
                                                                              CheckboxListTile(
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            value:
                                                                                isLaura,
                                                                            onChanged:
                                                                                (bool? laura) {
                                                                              if (isFuneral == false) {
                                                                                setState(() {
                                                                                  isLaura = laura;
                                                                                });
                                                                              }
                                                                              if (isFuneral == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Funeral Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                              if (isBar == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Bar Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                              if (isParty == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Party Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              'Laura is here',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink[900]),
                                                                            ),
                                                                            subtitle:
                                                                                Text('Laura will be in attendance'),
                                                                            activeColor:
                                                                                Colors.green.shade200,
                                                                          )),
                                                                      Align(
                                                                          alignment: Alignment(
                                                                              0,
                                                                              -0.6),
                                                                          child:
                                                                              CheckboxListTile(
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            value:
                                                                                isOma,
                                                                            onChanged:
                                                                                (bool? oma) {
                                                                              if (isFuneral == false) {
                                                                                setState(() {
                                                                                  isOma = oma;
                                                                                });
                                                                              }
                                                                              if (isFuneral == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Funeral Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                              if (isBar == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Bar Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                              if (isParty == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Party Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              'Oma is here',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink[900]),
                                                                            ),
                                                                            subtitle:
                                                                                Text('Oma will be in attendance'),
                                                                            activeColor:
                                                                                Colors.green.shade200,
                                                                          )),
                                                                      Align(
                                                                          alignment: Alignment(
                                                                              0,
                                                                              -0.3),
                                                                          child:
                                                                              CheckboxListTile(
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            value:
                                                                                isEdl,
                                                                            onChanged:
                                                                                (bool? edl) {
                                                                              if (isFuneral == false) {
                                                                                setState(() {
                                                                                  isEdl = edl;
                                                                                });
                                                                              }
                                                                              if (isFuneral == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Funeral Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                              if (isBar == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Bar Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                              if (isParty == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Party Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                            },
                                                                            title:
                                                                                Text(
                                                                              'Edls are here',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink[900]),
                                                                            ),
                                                                            subtitle:
                                                                                Text('Heather and David will be in attendance'),
                                                                            activeColor:
                                                                                Colors.green.shade200,
                                                                          )),
                                                                      Align(
                                                                          alignment: Alignment(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              CheckboxListTile(
                                                                            controlAffinity:
                                                                                ListTileControlAffinity.leading,
                                                                            value:
                                                                                isRoth,
                                                                            onChanged:
                                                                                (bool? roth) {
                                                                              if (isFuneral == false) {
                                                                                setState(() {
                                                                                  isRoth = roth;
                                                                                });
                                                                              }
                                                                              if (isFuneral == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Funeral Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                              if (isBar == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Bar Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                              if (isParty == true) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                                  backgroundColor: Colors.red.shade600,
                                                                                  duration: Duration(seconds: 1),
                                                                                  content: Text(
                                                                                    "Cannot check while Party Mode is active",
                                                                                    style: TextStyle(fontWeight: FontWeight.w600),
                                                                                  ),
                                                                                ));
                                                                              }
                                                                            },
                                                                            activeColor:
                                                                                Colors.green.shade200,
                                                                            title:
                                                                                Text(
                                                                              'Rothwells are here',
                                                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink[900]),
                                                                            ),
                                                                            subtitle:
                                                                                Text('Diane, Don, or Kathi will be in attendance'),
                                                                          )),
                                                                      Align(
                                                                        alignment: Alignment(
                                                                            0,
                                                                            .5),
                                                                        child: Material(
                                                                            color: Colors.pink.shade300,
                                                                            child: InkWell(
                                                                                splashFactory: InkRipple.splashFactory,
                                                                                splashColor: Colors.teal.shade700.withOpacity(0.5),
                                                                                highlightColor: Colors.teal.shade700.withOpacity(0.5),
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(20.0),
                                                                                ),
                                                                                onTap: () {
                                                                                  _controller.nextPage(
                                                                                    duration: Duration(milliseconds: 300),
                                                                                    curve: Curves.easeIn,
                                                                                  );
                                                                                  Navigator.of(context, rootNavigator: true).pop();
                                                                                },
                                                                                child: Ink(
                                                                                    height: 65,
                                                                                    width: 125,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.all(
                                                                                        Radius.circular(20.0),
                                                                                      ),
                                                                                      color: Colors.teal.shade400,
                                                                                    ),
                                                                                    child: Center(
                                                                                      child: Text(
                                                                                        'Submit',
                                                                                        style: GoogleFonts.quicksand(
                                                                                          color: Colors.white,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontSize: 18,
                                                                                        ),
                                                                                      ),
                                                                                    )))),
                                                                      )
                                                                    ],
                                                                  );
                                                                }))));
                                                  }
                                                },
                                                icon: const Icon(Icons.send),
                                              )),
                                        );
                                      }))));
                            }
                          },
                          child: Container(
                            height: 80,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: Colors.greenAccent.shade400,
                            ),
                            child: Center(
                                child: Text(
                              'Join Game',
                              style: GoogleFonts.quicksand(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),

                //Page 4

                Container(
                  color: Colors.deepPurpleAccent[100],
                  child: Stack(children: <Widget>[
                    Align(
                        alignment: Alignment(0, -0.5),
                        child: Container(
                          child: Text(
                              "If this is your first time playing Ming-O, please watch this video for a quick guide...",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.deepPurple[900])),
                        )),
                    Align(
                      alignment: Alignment(0, 0),
                      child: ElevatedButton(
                        child: Text('Start Ming-O'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          primary: Colors.cyan.shade700,
                        ),
                        onPressed: () async {
                          if (isCustom == false &&
                              isUniversal == false &&
                              isFuneral == false &&
                              isBar == false &&
                              isParty == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red.shade600,
                              duration: Duration(seconds: 1),
                              content: Text(
                                'Please select a mode!',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ));
                          }
                          if (textController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red.shade600,
                              duration: Duration(seconds: 1),
                              content: Text(
                                'Username is required to continue...',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ));
                          }

                          if (textController.text.isNotEmpty &&
                              isBar == false &&
                              isFuneral == false &&
                              isParty == false &&
                              isUniversal == true) {
                            gameList gl = new gameList(isLaura, isOma, isEdl,
                                isRoth, isFuneral, isBar, isParty, isUniversal);

                            tileAssignment = gl.tileAssignment;
                            shownDescriptions = gl.shownDescriptions;
                            if (isFuneral == true) {
                              gameMode = 'funeral';
                            } else if (isBar == true) {
                              gameMode = 'bar';
                            } else if (isParty == true) {
                              gameMode = 'party';
                            } else {
                              gameMode = 'AERFAMILY';
                            }
                            joinedGame();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => gamescreen())));
                          }
                          if (textController.text.isNotEmpty && isBar == true ||
                              textControllerKey.text.contains('BAR')) {
                            isBar = true;
                            gameList gl = new gameList(isLaura, isOma, isEdl,
                                isRoth, isFuneral, isBar, isParty, isUniversal);

                            tileAssignment = gl.tileAssignment;
                            shownDescriptions = gl.shownDescriptions;
                            if (isBar == true) {
                              gameMode = 'bar';
                            }
                            joinedGame();
                          }
                          if (textController.text.isNotEmpty &&
                                  isParty == true ||
                              textControllerKey.text.contains('PARTY')) {
                            isParty = true;
                            gameList gl = new gameList(isLaura, isOma, isEdl,
                                isRoth, isFuneral, isBar, isParty, isUniversal);

                            tileAssignment = gl.tileAssignment;
                            shownDescriptions = gl.shownDescriptions;
                            if (isParty == true) {
                              gameMode = 'party';
                            }
                            joinedGame();
                          }
                          if (textController.text.isNotEmpty &&
                                  isFuneral == true ||
                              textControllerKey.text.contains('FUNERAL')) {
                            isFuneral = true;
                            gameList gl = new gameList(isLaura, isOma, isEdl,
                                isRoth, isFuneral, isBar, isParty, isUniversal);

                            tileAssignment = gl.tileAssignment;
                            shownDescriptions = gl.shownDescriptions;
                            if (isFuneral == true) {
                              gameMode = 'funeral';
                            }
                            joinedGame();
                          }
                        },
                      ),
                    ),
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
                  ]),
                ),
              ],
            ),
            Container(
                alignment: const Alignment(0, 0.9),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: JumpingDotEffect(
                    verticalOffset: 10,
                    dotColor: Colors.blueGrey.shade600,
                    activeDotColor: Colors.deepPurpleAccent.shade700,
                  ),
                ))
          ])),
    );
  }
}
