import 'dart:ffi';
import 'dart:convert';
import 'package:grouped_list/grouped_list.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:bingo_application/List/lists.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'package:bingo_application/screens/bingoWin.dart';
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

// import 'package:firebase_database/ui/firebase_animated_list.dart';

// import 'package:just_audio/just_audio.dart';

class gamescreen extends StatefulWidget {
  @override
  gamescreenState createState() => gamescreenState();
}

class gamescreenState extends State<gamescreen> {
  final player = AudioPlayer();
  int noteRandom = 0;
// List and Currency data
  bool? isLaura;
  bool? isOma;
  bool? isEdl;
  bool? isRoth;
  List tileAssignment = [];
  List shownDescriptions = [];
  List newAssignment = [];
  List messageFromClass = messageBoardState.messages;
  String myName = "";
  String myAbilName = "";

  final FirstPage fp = new FirstPage();
  static int points = 1000;
  int addPointsOne = 25;
  int addPointsTwo = 25;
  int addPointsThree = 25;
  int addPointsFour = 25;
  int addPointsFive = 25;
  int addPointsSix = 25;
  int addPointsSeven = 25;
  int addPointsEight = 25;
  int addPointsNine = 25;
  int addPointsTen = 25;
  int addPointsEleven = 25;
  int addPointsTwelve = 25;
  int addPointsThirteen = 0;
  int addPointsFourteen = 25;
  int addPointsFifteen = 25;
  int addPointsSixteen = 25;
  int addPointsSeventeen = 25;
  int addPointsEighteen = 25;
  int addPointsNineteen = 25;
  int addPointsTwenty = 25;
  int addPointsTwentyOne = 25;
  int addPointsTwentyTwo = 25;
  int addPointsTwentyThree = 25;
  int addPointsTwentyFour = 25;
  int addPointsTwentyFive = 25;
//
//
//
//
//ATTACK!!!!!!!!
  int uncheckSingle = -1;
  int uncheckTripleOne = -1;
  int uncheckTripleTwo = -1;
  int uncheckTripleThree = -1;

  int checkedTiles = 1;

//method to create abilities documents?
  static List abilitiesList = [];

  Future actAbilities() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    myName = modelClass.value;
    myAbilName = '$myName-ABILITIES';
    final refAbilities =
        FirebaseFirestore.instance.collection('abilities').doc(myAbilName);
    await refAbilities.set({'TripleAttack': false, 'SingleAttack': false});
  }

//
//
//
//

  bool tileOnePoints = true;
  bool tileTwoPoints = true;
  bool tileThreePoints = true;
  bool tileFourPoints = true;
  bool tileFivePoints = true;
  bool tileSixPoints = true;
  bool tileSevenPoints = true;
  bool tileEightPoints = true;
  bool tileNinePoints = true;
  bool tileTenPoints = true;
  bool tileElevenPoints = true;
  bool tileTwelvePoints = true;
  bool tileThirteenPoints = true;
  bool tileFourteenPoints = true;
  bool tileFifteenPoints = true;
  bool tileSixteenPoints = true;
  bool tileSeventeenPoints = true;
  bool tileEighteenPoints = true;
  bool tileNineteenPoints = true;
  bool tileTwentyPoints = true;
  bool tileTwentyOnePoints = true;
  bool tileTwentyTwoPoints = true;
  bool tileTwentyThreePoints = true;
  bool tileTwentyFourPoints = true;
  bool tileTwentyFivePoints = true;

  //Timer for using an ability
  double _opacityTimer = 1;
  static int messageNotification = 0;

//cooldown timer
  Timer? timer;
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      //set Duration back to seconds: 1 when making offical and maxSeconds = 300 (aka 5 minute timer)
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        stopTimer(reset: true);
      }
    });
  }

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer?.cancel();
  }

  void resetTimer() {
    setState(() {
      seconds = maxSeconds;
    });
  }

//Ability Animation Timer

  Timer? timerAni;
  static const maxSecondsAni = 4;
  int secondsAni = maxSecondsAni;
  void startTimerAni() {
    timerAni = Timer.periodic(Duration(seconds: 1), (_) {
      //set Duration back to seconds: 1 when making offical and maxSeconds = 300 (aka 5 minute timer)
      if (secondsAni > 0) {
        setState(() {
          secondsAni--;
        });
      } else {
        stopTimerAni(reset: true);
      }
    });
  }

  void stopTimerAni({bool reset = true}) {
    if (reset) {
      resetTimerAni();
    }
    timerAni?.cancel();
  }

  void resetTimerAni() {
    setState(() {
      secondsAni = maxSecondsAni;
      abilityStateMachineInput.value = false;
    });
  }

//Page 1 data
  int tileLockCount = 0;
  int randThreeLockCount = 0;
  int bandageCount = 0;
  bool abilityUseCount = false;
  double bandageUseCount = 0;

  int healthLevel = 5;

  bool fiveHearts = true;
  bool fourHearts = false;
  bool threeHearts = false;
  bool twoHearts = false;
  bool oneHearts = false;

  late SMIInput<bool> fiveHeartStateMachineInput;
  late SMIInput<bool> fourHeartStateMachineInput;
  late SMIInput<bool> threeHeartStateMachineInput;
  late SMIInput<bool> twoHeartStateMachineInput;
  late SMIInput<bool> oneHeartStateMachineInput;
  late SMIInput<bool> abilityStateMachineInput;

  void _onInit(Artboard Idle) {
    var controller = StateMachineController.fromArtboard(
      Idle,
      'Heartbeat',
    )!;
    Idle.addController(controller);
    fiveHeartStateMachineInput =
        controller.findInput<bool>('fiveHearts') as SMIBool;
    fourHeartStateMachineInput =
        controller.findInput<bool>('fourHearts') as SMIBool;
    threeHeartStateMachineInput =
        controller.findInput<bool>('threeHearts') as SMIBool;
    twoHeartStateMachineInput =
        controller.findInput<bool>('twoHearts') as SMIBool;
    oneHeartStateMachineInput =
        controller.findInput<bool>('oneHearts') as SMIBool;
    abilityStateMachineInput =
        controller.findInput<bool>('abilityUseCount') as SMIBool;

    if (healthLevel == 5) {
      setState(() {
        fiveHeartStateMachineInput.value = true;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 4) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = true;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 3) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = true;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 2) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = true;

        oneHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 1) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = true;
      });
    }
  }

  gamescreenState();

  final values = List.filled(25, false);
  final List changeStateValues = List.filled(25, false);
  final children = <Widget>[];
  var c = 0;

//Getting the name from the modelclass.dart file
  ModelClass modelClass = GetIt.instance.get<ModelClass>();

//setting the booleans for the different people that may be present

  set setisRoth(bool? isRoth) {
    this.isRoth = isRoth;
  }

  set setisEdl(bool? isEdl) {
    this.isEdl = isEdl;
  }

  set setisOma(bool? isOma) {
    this.isOma = isOma;
  }

  set setisLaura(bool? isLaura) {
    this.isLaura = isLaura;
  }

  set settileAssignment(List tileAssignment) {
    this.tileAssignment = tileAssignment;
  }

  set setshownDescriptions(List shownDescriptions) {
    this.shownDescriptions = shownDescriptions;
  }

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

  get gettileAssignment {
    return tileAssignment;
  }

  get getshownDescriptions {
    return shownDescriptions;
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  PageController _controller = PageController(initialPage: 1);
  @override
  void initState() {
    super.initState();
    setState(() {
      values[12] = true;
    });
    _controller = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

//

  singleUncheckMethod() {
    uncheckSingle = Random().nextInt(25);
    if (values[uncheckSingle.toInt()] == true && checkedTiles >= 1) {
      values[uncheckSingle.toInt()] = false;
      checkedTiles--;
      healthLevel--;
      healthConditions();
    } else if (checkedTiles == 0) {
    } else {
      singleUncheckMethod();
    }
  }

  tripleUncheckMethod() {
    uncheckTripleOne = Random().nextInt(25);
    uncheckTripleTwo = Random().nextInt(25);
    uncheckTripleThree = Random().nextInt(25);
    if (values[uncheckTripleOne.toInt()] == true &&
        values[uncheckTripleTwo.toInt()] == true &&
        values[uncheckTripleThree.toInt()] == true &&
        uncheckTripleOne.toInt() != uncheckTripleTwo &&
        uncheckTripleOne.toInt() != uncheckTripleThree &&
        uncheckTripleTwo.toInt() != values[uncheckTripleOne] &&
        uncheckTripleTwo.toInt() != uncheckTripleOne &&
        uncheckTripleThree.toInt() != uncheckTripleOne &&
        uncheckTripleThree.toInt() != uncheckTripleTwo &&
        checkedTiles >= 3) {
      //spacing this out good lord
      values[uncheckTripleOne.toInt()] = false;
      values[uncheckTripleTwo.toInt()] = false;
      values[uncheckTripleThree.toInt()] = false;
      checkedTiles = checkedTiles - 3;

      healthLevel--;
      healthConditions();
    } else if (checkedTiles <= 2) {
    } else {
      tripleUncheckMethod();
    }
  }

  healthConditions() {
    if (healthLevel == 5) {
      setState(() {
        fiveHearts == true;
        fourHearts == false;
        threeHearts == false;
        twoHearts == false;
        oneHearts == false;

        fiveHeartStateMachineInput.value = true;
        fourHeartStateMachineInput.value = false;
        threeHeartStateMachineInput.value = false;
        twoHeartStateMachineInput.value = false;
        oneHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 4) {
      setState(() {
        fiveHearts == false;
        fourHearts == true;
        threeHearts == false;
        twoHearts == false;
        oneHearts == false;

        fiveHeartStateMachineInput.value = false;
        fourHeartStateMachineInput.value = true;
        threeHeartStateMachineInput.value = false;
        twoHeartStateMachineInput.value = false;
        oneHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 3) {
      setState(() {
        fiveHearts == false;
        fourHearts == false;
        threeHearts == true;
        twoHearts == false;
        oneHearts == false;

        fiveHeartStateMachineInput.value = false;
        fourHeartStateMachineInput.value = false;
        threeHeartStateMachineInput.value = true;
        twoHeartStateMachineInput.value = false;
        oneHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 2) {
      setState(() {
        fiveHearts == false;
        fourHearts == false;
        threeHearts == false;
        twoHearts == true;
        oneHearts == false;

        fiveHeartStateMachineInput.value = false;
        fourHeartStateMachineInput.value = false;
        threeHeartStateMachineInput.value = false;
        twoHeartStateMachineInput.value = true;
        oneHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 1) {
      setState(() {
        fiveHearts == false;
        fourHearts == false;
        threeHearts == false;
        twoHearts == false;
        oneHearts == true;

        fiveHeartStateMachineInput.value = false;
        fourHeartStateMachineInput.value = false;
        threeHeartStateMachineInput.value = false;
        twoHeartStateMachineInput.value = false;
        oneHeartStateMachineInput.value = true;
      });
    }

    if (healthLevel <= 0) {
      setState(() {
        healthLevel = 0;
      });
    }

    if (healthLevel >= 5) {
      setState(() {
        healthLevel = 5;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRunning = timer == null ? false : timer!.isActive;

    final panelHeightOpen = MediaQuery.of(context).size.height * 0.885;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.075;

    final gamescreenState gs = gamescreenState();

//cooldown is running
    if (isRunning == true) {
      setState(() {
        _opacityTimer = 1;
      });
    } else {
      _opacityTimer = 0;
    }

    // This is for the message notifications.

    double notOpac = 1;
    if (messageNotification == 0) {
      setState(() {
        notOpac = 0;
      });
    } else {
      setState(() {
        notOpac = 1;
      });
    }

    gs.settileAssignment = fp.gettileAssignment;
    gs.setshownDescriptions = fp.getshownDescriptions;
    print("Output from getter from gameScreen: ${gs.gettileAssignment}");
    newAssignment = gs.gettileAssignment;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 35,
                  ),
                ),
                Text(modelClass.value + '          ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Container(
                  height: 25,
                  width: 40,
                  decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage('assets/FishIcon.png'),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  points.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                      color: Colors.yellow.shade400.withOpacity(0.75),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 75,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false),
        backgroundColor: Colors.indigo.shade400,
        body: SlidingUpPanel(
            body: PageView(
              // physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: [
                //____________________________________________________________________________________________________________________________________________
                //____________________________________________________________________________________________________________________________________________
                //____________________________________________________________________________________________________________________________________________

                Stack(
                  children: [
                    Container(
                      color: Color.fromRGBO(255, 138, 101, 1),
                      child: Align(
                          alignment: Alignment(0, 0.9),
                          child: Container(
                            height: 550,
                            child: Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child: Container(
                                  child: GestureDetector(
                                    onTap: () async {
                                      await player.play(
                                          AssetSource('MingSqueak.mp3'),
                                          mode: PlayerMode.mediaPlayer);
                                    },
                                    onDoubleTap: () async {
                                      await player.play(
                                          AssetSource('MingSqueak.mp3'),
                                          mode: PlayerMode.mediaPlayer);
                                    },
                                    child: RiveAnimation.asset(
                                      'assets/Mingeruchi.riv',
                                      artboard: "Idle",
                                      alignment: Alignment.bottomCenter,
                                      fit: BoxFit.fitHeight,
                                      stateMachines: ['Heartbeat'],
                                      onInit: _onInit,
                                    ),
                                  ),
                                )),
                          )),
                    ),

                    //tileLock Button
                    Row(
                      children: [
                        Align(
                          alignment: Alignment(-0.8, -0.85),
                          child: Material(
                            color: Color.fromRGBO(255, 138, 101, 1),
                            child: InkWell(
                              splashFactory: InkRipple.splashFactory,
                              splashColor:
                                  Colors.indigo.shade700.withOpacity(0.5),
                              highlightColor:
                                  Colors.indigo.shade700.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              onLongPress: () {
                                if (tileLockCount > 0 && isRunning == false) {
                                  setState(() {
                                    messageNotification++;
                                    singleUncheckMethod();
                                    startTimer();
                                    startTimerAni();
                                    abilityStateMachineInput.value = true;
                                    tileLockCount--;
                                    //testing
                                    actAbilities();
                                  });
                                } else if (tileLockCount <= 0 &&
                                    isRunning == false) {
                                  tileLockCount = 0;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "You are out of tile locks!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                                if (isRunning == true) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "You are on cooldown",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                              },
                              child: Ink(
                                height: 65,
                                width: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.indigo.shade300,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Align(
                            alignment: Alignment(-0.8, -0.8),
                            child: Text(
                              'x ' + tileLockCount.toString(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 24),
                            )),
                      ],
                    ),

                    //randFourLock Attack Button
                    Row(
                      children: [
                        Align(
                          alignment: Alignment(-0.8, -0.6),
                          child: Material(
                            color: Color.fromRGBO(255, 138, 101, 1),
                            child: InkWell(
                              splashFactory: InkRipple.splashFactory,
                              splashColor:
                                  Colors.teal.shade700.withOpacity(0.5),
                              highlightColor:
                                  Colors.teal.shade700.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              onLongPress: () {
                                if (randThreeLockCount > 0 &&
                                    isRunning == false) {
                                  setState(() {
                                    startTimer();
                                    randThreeLockCount--;
                                    tripleUncheckMethod();
                                    startTimerAni();
                                    abilityStateMachineInput.value = true;

                                    //test for abilities
                                  });
                                } else if (randThreeLockCount <= 0 &&
                                    isRunning == false) {
                                  randThreeLockCount = 0;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "You are out of random 3 locks!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                                if (isRunning == true) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "You are on cooldown",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Align(
                            alignment: Alignment(-0.8, -0.575),
                            child: Text(
                              'x ' + randThreeLockCount.toString(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 24),
                            )),
                      ],
                    ),

                    // Bandage Button
                    Row(
                      children: [
                        Align(
                          alignment: Alignment(-0.8, -0.35),
                          child: Material(
                            color: Color.fromRGBO(255, 138, 101, 1),
                            child: InkWell(
                              splashFactory: InkRipple.splashFactory,
                              splashColor: Colors.red.shade700.withOpacity(0.5),
                              highlightColor:
                                  Colors.red.shade700.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              onLongPress: () {
                                if (bandageCount > 0) {
                                  setState(() {
                                    healthLevel++;
                                    healthConditions();
                                    bandageCount--;
                                    bandageUseCount++;
                                  });
                                } else if (bandageCount <= 0) {
                                  bandageCount = 0;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "You are out of bandages!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                              },
                              child: Ink(
                                  height: 65,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: Colors.red.shade400),
                                  child: RiveAnimation.asset(
                                    'assets/Mingeruchi.riv',
                                    artboard: "Bandage",
                                    animations: [],
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.center,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Align(
                            alignment: Alignment(-0.8, -0.325),
                            child: Text(
                              'x ' + bandageCount.toString(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 24),
                            )),
                      ],
                    ),

                    Align(
                      alignment: Alignment(0.4, -.75),
                      child: AnimatedOpacity(
                        opacity: _opacityTimer,
                        duration: const Duration(seconds: 1),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/Timer.png'),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
                //____________________________________________________________________________________________________________________________________________
                //____________________________________________________________________________________________________________________________________________
                //____________________________________________________________________________________________________________________________________________

                Stack(children: [
                  Positioned(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.8),
                      itemCount: values.length,
                      itemBuilder: (context, index) {
                        if (values[index] == !changeStateValues[index] &&
                            values[index] == true) {
                          changeStateValues[index] = true;
                        }

                        if (values[index] == !changeStateValues[index] &&
                            values[index] == false) {
                          changeStateValues[index] = false;
                        }

                        //HORIZONTAL
                        if (values[0] == true &&
                            values[1] == true &&
                            values[2] == true &&
                            values[3] == true &&
                            values[4]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }
                        if (values[5] == true &&
                            values[6] == true &&
                            values[7] == true &&
                            values[8] == true &&
                            values[9]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }
                        if (values[10] == true &&
                            values[11] == true &&
                            values[12] == true &&
                            values[13] == true &&
                            values[14]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        if (values[15] == true &&
                            values[16] == true &&
                            values[17] == true &&
                            values[18] == true &&
                            values[19]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        if (values[20] == true &&
                            values[21] == true &&
                            values[22] == true &&
                            values[23] == true &&
                            values[24]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

//VERTICAL
                        if (values[0] == true &&
                            values[5] == true &&
                            values[10] == true &&
                            values[15] == true &&
                            values[20]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        if (values[1] == true &&
                            values[6] == true &&
                            values[11] == true &&
                            values[16] == true &&
                            values[21]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        if (values[2] == true &&
                            values[7] == true &&
                            values[12] == true &&
                            values[17] == true &&
                            values[22]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        if (values[3] == true &&
                            values[8] == true &&
                            values[13] == true &&
                            values[18] == true &&
                            values[23]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        if (values[4] == true &&
                            values[9] == true &&
                            values[14] == true &&
                            values[19] == true &&
                            values[24]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

//DIAGONAL
                        if (values[0] == true &&
                            values[6] == true &&
                            values[12] == true &&
                            values[18] == true &&
                            values[24]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        if (values[4] == true &&
                            values[8] == true &&
                            values[12] == true &&
                            values[16] == true &&
                            values[20]) {
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        values[index];

                        return GestureDetector(
                          onTap: () async {
                            setState(() => values[index] = !values[index]);
                            if (values[index]) {
                              checkedTiles++;
                            } else if (values[index] == false) {
                              checkedTiles--;
                            }

                            if (values[0] == true && tileOnePoints == true) {
                              setState(() {
                                points += addPointsOne;
                                tileOnePoints = false;
                                addPointsOne = 0;
                              });
                              print('Tile One Points');
                              print(tileOnePoints);
                            }
                            if (values[1] == true && tileTwoPoints == true) {
                              setState(() {
                                points += addPointsTwo;
                                tileTwoPoints = false;
                                addPointsTwo = 0;
                              });
                            }
                            if (values[2] == true && tileThreePoints == true) {
                              setState(() {
                                points += addPointsThree;
                                tileThreePoints = false;
                                addPointsThree = 0;
                              });
                            }
                            if (values[3] == true && tileFourPoints == true) {
                              setState(() {
                                points += addPointsFour;
                                tileFourPoints = false;
                                addPointsFour = 0;
                              });
                            }
                            if (values[4] == true && tileFivePoints == true) {
                              setState(() {
                                points += addPointsFive;
                                tileFivePoints == false;
                                addPointsFive = 0;
                              });
                            }
                            if (values[5] == true && tileSixPoints == true) {
                              setState(() {
                                points += addPointsSix;
                                tileSixPoints == false;
                                addPointsSix = 0;
                              });
                            }
                            if (values[6] == true && tileSevenPoints == true) {
                              setState(() {
                                points += addPointsSeven;
                                tileSevenPoints == false;
                                addPointsSeven = 0;
                              });
                            }
                            if (values[7] == true && tileEightPoints == true) {
                              setState(() {
                                points += addPointsEight;
                                tileEightPoints = false;
                                addPointsEight = 0;
                              });
                            }
                            if (values[8] == true && tileNinePoints == true) {
                              setState(() {
                                points += addPointsNine;
                                tileNinePoints = false;
                                addPointsNine = 0;
                              });
                            }
                            if (values[9] == true && tileTenPoints == true) {
                              setState(() {
                                points += addPointsTen;
                                tileTenPoints = false;
                                addPointsTen = 0;
                              });
                            }
                            if (values[10] == true &&
                                tileElevenPoints == true) {
                              setState(() {
                                points += addPointsEleven;
                                tileElevenPoints = false;
                                addPointsEleven = 0;
                              });
                            }
                            if (values[11] == true &&
                                tileTwelvePoints == true) {
                              setState(() {
                                points += addPointsTwelve;
                                tileTwelvePoints = false;
                                addPointsTwelve = 0;
                              });
                            }
                            if (values[12] == true &&
                                tileThirteenPoints == true) {
                              setState(() {
                                points += addPointsThirteen;
                                tileThirteenPoints = false;
                                addPointsThirteen = 0;
                              });
                            }
                            if (values[13] == true &&
                                tileFourteenPoints == true) {
                              setState(() {
                                points += addPointsFourteen;
                                tileFourPoints = false;
                                addPointsFourteen = 0;
                              });
                            }
                            if (values[14] == true &&
                                tileFifteenPoints == true) {
                              setState(() {
                                points += addPointsFifteen;
                                tileFifteenPoints = false;
                                addPointsFifteen = 0;
                              });
                            }
                            if (values[15] == true &&
                                tileSixteenPoints == true) {
                              setState(() {
                                points += addPointsSixteen;
                                tileSixteenPoints = false;
                                addPointsSixteen = 0;
                              });
                            }
                            if (values[16] == true &&
                                tileSeventeenPoints == true) {
                              setState(() {
                                points += addPointsSeventeen;
                                tileSeventeenPoints = false;
                                addPointsSeventeen = 0;
                              });
                            }
                            if (values[17] == true &&
                                tileEighteenPoints == true) {
                              setState(() {
                                points += addPointsEighteen;
                                tileEighteenPoints = false;
                                addPointsEighteen = 0;
                              });
                            }
                            if (values[18] == true &&
                                tileNineteenPoints == true) {
                              setState(() {
                                points += addPointsNineteen;
                                tileNineteenPoints = false;
                                addPointsNineteen = 0;
                              });
                            }
                            if (values[19] == true &&
                                tileTwentyPoints == true) {
                              setState(() {
                                points += addPointsTwenty;
                                tileTwentyPoints = false;
                                addPointsTwenty = 0;
                              });
                            }
                            if (values[20] == true &&
                                tileTwentyOnePoints == true) {
                              setState(() {
                                points += addPointsTwentyOne;
                                tileTwentyOnePoints = false;
                                addPointsTwentyOne = 0;
                              });
                            }
                            if (values[21] == true &&
                                tileTwentyTwoPoints == true) {
                              setState(() {
                                points += addPointsTwentyTwo;
                                tileTwentyTwoPoints = false;
                                addPointsTwentyTwo = 0;
                              });
                            }
                            if (values[22] == true &&
                                tileTwentyThreePoints == true) {
                              setState(() {
                                points += addPointsTwentyThree;
                                tileTwentyThreePoints = false;
                                addPointsTwentyThree = 0;
                              });
                            }
                            if (values[23] == true &&
                                tileTwentyFourPoints == true) {
                              setState(() {
                                points += addPointsTwentyFour;
                                tileTwentyFourPoints = false;
                                addPointsTwentyFour = 0;
                              });
                            }

                            if (values[24] == true &&
                                tileTwentyFivePoints == true) {
                              setState(() {
                                points += addPointsTwentyFive;
                                tileTwentyFivePoints = false;
                                addPointsTwentyFour = 0;
                              });
                            }
                            changeStateValues[index] = values[index];
                            noteRandom = Random().nextInt(5);
                            if (noteRandom == 0 && values[index] == true) {
                              await player.play(AssetSource('LowD.mp3'),
                                  mode: PlayerMode.mediaPlayer);
                            }
                            if (noteRandom == 1 && values[index] == true) {
                              await player.play(AssetSource('FSharp.mp3'),
                                  mode: PlayerMode.mediaPlayer);
                            }
                            if (noteRandom == 2 && values[index] == true) {
                              await player.play(AssetSource('A.mp3'),
                                  mode: PlayerMode.mediaPlayer);
                            }
                            if (noteRandom == 3 && values[index] == true) {
                              await player.play(AssetSource('B.mp3'),
                                  mode: PlayerMode.mediaPlayer);
                            }
                            if (noteRandom == 4 && values[index] == true) {
                              await player.play(AssetSource('HighD.mp3'),
                                  mode: PlayerMode.mediaPlayer);
                            }
                          },
                          child: Container(
                            height: 75,
                            width: 75,
                            padding: EdgeInsets.all(.5),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                newAssignment[index],
                                maxLines: 5,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo.shade900),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: values[index]
                                    ? Colors.green.shade300
                                    : Colors.blue.shade100),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.90, 0.75),
                    child: Hero(
                        tag: 'message',
                        child: GestureDetector(
                            onTap: () {
                              if (messageNotification > 0) {
                                setState(() {
                                  notOpac == 0;
                                  messageNotification = 0;
                                });
                              }

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((
                                    context,
                                  ) =>
                                          messageBoard())));
                            },
                            child: Container(
                              height: 70,
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/Message Icon.png'),
                                fit: BoxFit.fill,
                              )),
                            ))),
                  ),
                  Align(
                    alignment: Alignment(0.95, 0.63),
                    child: Opacity(
                      opacity: notOpac,
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade800),
                          child: Center(
                            child: Text(
                              messageNotification.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                  ),
                ]),

                //____________________________________________________________________________________________________________________________________________
                //____________________________________________________________________________________________________________________________________________
                //____________________________________________________________________________________________________________________________________________

                Stack(
                  children: [
                    Container(
                      color: Colors.green.shade300,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment(-0.8, -0.7),
                          child: Material(
                            color: Colors.green.shade300,
                            child: InkWell(
                              splashFactory: InkRipple.splashFactory,
                              splashColor:
                                  Colors.indigo.shade700.withOpacity(0.5),
                              highlightColor:
                                  Colors.indigo.shade700.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              onLongPress: () {
                                if (points >= 50) {
                                  setState(() {
                                    tileLockCount++;
                                    points -= 50;
                                  });
                                } else if (points < 50) {
                                  setState(() {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red.shade600,
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                        "Insufficient Funds",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ));
                                  });
                                }
                              },
                              child: Ink(
                                height: 65,
                                width: 125,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: Colors.indigo.shade300,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Align(
                            alignment: Alignment(-0.8, -0.725),
                            child: Text(
                              'x ' + tileLockCount.toString(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 24),
                            )),
                      ],
                    ),
                    Align(
                        alignment: Alignment(-0.05, -0.625),
                        child: Text(
                          'x50',
                          style: TextStyle(
                              color: Colors.yellow.shade200.withOpacity(1),
                              fontSize: 18),
                        )),
                    Align(
                      alignment: Alignment(-0.45, -0.6),
                      child: GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32))),
                                    backgroundColor:
                                        Colors.indigo.shade500.withOpacity(.95),
                                    title: Text(
                                      'Single Tile Unchecker',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                        "It's cheap and it's effective! A single tile unchecker will randomly uncheck an opponents tile that has already been checked. \n\n This will require your opponents to try to qualify that tile again.",
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  )));
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo.shade500.withOpacity(1),
                            ),
                            child: Center(
                              child: Text(
                                "?",
                                style: GoogleFonts.quicksand(
                                  color: Colors.white.withOpacity(.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.25, -0.625),
                      child: Container(
                        height: 20,
                        width: 30,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage('assets/FishIcon.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment(-0.8, -0.4),
                          child: Material(
                            color: Colors.green.shade300,
                            child: InkWell(
                              splashFactory: InkRipple.splashFactory,
                              splashColor:
                                  Colors.teal.shade700.withOpacity(0.5),
                              highlightColor:
                                  Colors.teal.shade700.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              onLongPress: () {
                                if (points >= 125) {
                                  setState(() {
                                    randThreeLockCount++;
                                    points -= 125;
                                  });
                                } else if (points < 125) {
                                  setState(() {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red.shade600,
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                        "Insufficient Funds",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ));
                                  });
                                }
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
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Align(
                            alignment: Alignment(-0.8, -0.425),
                            child: Text(
                              'x ' + randThreeLockCount.toString(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 24),
                            )),
                      ],
                    ),
                    Align(
                        alignment: Alignment(-0.05, -0.325),
                        child: Text(
                          ' x125',
                          style: TextStyle(
                              color: Colors.yellow.shade200.withOpacity(1),
                              fontSize: 18),
                        )),
                    Align(
                      alignment: Alignment(-0.45, -0.3),
                      child: GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32))),
                                    backgroundColor:
                                        Colors.teal.shade700.withOpacity(.95),
                                    title: Text(
                                      'Triple Tile Unchecker',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                        "Want to really hurt your opponents? Try unchecking 3 random tiles that your opponents have initially checked.\n\n This will require your opponents to try to qualify those tiles again.",
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  )));
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.teal.shade700.withOpacity(1),
                            ),
                            child: Center(
                              child: Text(
                                "?",
                                style: GoogleFonts.quicksand(
                                  color: Colors.white.withOpacity(.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.25, -0.325),
                      child: Container(
                        height: 20,
                        width: 30,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage('assets/FishIcon.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment(-0.8, -0.1),
                          child: Material(
                            color: Colors.green.shade300,
                            child: InkWell(
                              splashFactory: InkRipple.splashFactory,
                              splashColor: Colors.red.shade700.withOpacity(0.5),
                              highlightColor:
                                  Colors.red.shade700.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              onLongPress: () {
                                if (points >= 25) {
                                  setState(() {
                                    bandageCount++;
                                    points -= 25;
                                  });
                                } else if (points < 25) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "Insufficient Funds",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }

                                ;
                              },
                              child: Ink(
                                  height: 65,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: Colors.red.shade400),
                                  child: RiveAnimation.asset(
                                      'assets/Mingeruchi.riv',
                                      artboard: "Bandage",
                                      animations: [],
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.center)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Align(
                            alignment: Alignment(-0.8, -0.15),
                            child: Text(
                              'x ' + bandageCount.toString(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 24),
                            )),
                      ],
                    ),
                    Align(
                        alignment: Alignment(-0.05, -0.05),
                        child: Text(
                          'x25',
                          style: TextStyle(
                              color: Colors.yellow.shade200.withOpacity(1),
                              fontSize: 18),
                        )),
                    Align(
                      alignment: Alignment(-0.45, -0.01),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32))),
                                    backgroundColor:
                                        Colors.red.shade800.withOpacity(.95),
                                    title: Text(
                                      'Bandage',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                        "A bandage may come in handy when Ming's health is looking a little low.\n\nUse a bandage to heal up one point of health.",
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  )));
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade900.withOpacity(1),
                            ),
                            child: Center(
                              child: Text(
                                "?",
                                style: GoogleFonts.quicksand(
                                  color: Colors.white.withOpacity(.8),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.25, -0.05),
                      child: Container(
                        height: 20,
                        width: 30,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: new AssetImage('assets/FishIcon.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            minHeight: panelHeightClosed,
            maxHeight: panelHeightOpen,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            color: Colors.purple.shade200,
            parallaxEnabled: true,
            parallaxOffset: .2,
            panelBuilder: (controller) => PanelWidget(
                  gs.gettileAssignment,
                  controller: controller,
                )),
      ),
    );
  }
}

class messageBoard extends StatefulWidget {
  @override
  messageBoardState createState() => messageBoardState();
}

ModelClass modelClass = GetIt.instance.get<ModelClass>();

class messageBoardState extends State<messageBoard> {
  ModelClass modelClass = GetIt.instance.get<ModelClass>();
  final apiKey = "AIzaSyChJLKaNpQ5no0pM_wnQtFv0TjVdRS58mc";
  final chatController = TextEditingController();
  // int notMess = gamescreenState.messageNotification;

  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('usernames');
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('messages');

  static List messages = [];

  Future getMessages() async {
    await FirebaseFirestore.instance
        .collection('messages')
        .orderBy('created', descending: true)
        .get()
        .then((snapshot) {
      messages.clear();
      snapshot.docs.forEach((document) {
        print(document.reference);
        messages.add(document.reference.id);
      });
    });

    if (mounted) {
      setState(() {
        messages = messages;
      });
    }
  }

  // @override
  // void initState() {
  //   getMessages();
  //   super.initState();
  // }

  @override
  void dispose() {
    super.dispose();
  }

//Zack also writes code here
  String message = "";

  Future uploadMessage(String message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    this.message = message;

    final refMessages =
        FirebaseFirestore.instance.collection('messages').doc(message);
    await refMessages.set({
      'username': modelClass.value.toString(),
      'message': message.toString(),
      'created': DateTime.now()
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
                foregroundColor: Colors.blue,
                title: Row(
                  children: [
                    Text(modelClass.value,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 195,
                    ),
                  ],
                ),
                elevation: 0,
                backgroundColor: Colors.deepOrange.shade300,
                automaticallyImplyLeading: true),
            body: Hero(
              tag: 'message',
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration:
                          BoxDecoration(color: Colors.deepOrange.shade100),
                      child: FutureBuilder(
                        future: getMessages(),
                        builder: (context, snapshot) {
                          print('Future Builder:' + getMessages().toString());
                          return Material(
                            color: Colors.deepOrange.shade100,
                            child: ListView.builder(
                              reverse: true,
                              itemCount: messages.length,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  title: Text(
                                    messages[index],
                                    style: GoogleFonts.quicksand(
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.deepOrange.shade100,
                    child: TextField(
                      controller: chatController,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (value) {
                        if (chatController.text.isNotEmpty) {
                          //Zack writes code here
                          FocusScope.of(context).unfocus();
                          uploadMessage(modelClass.value.toString() +
                              ': ' +
                              chatController.text);
                          chatController.clear();
                        }
                      },
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: true,
                      enableSuggestions: true,
                      onTap: () {},
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          labelText: 'Chat Here',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0),
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(25)),
                          labelStyle: TextStyle(
                            color: Colors.blue[700],
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (chatController.text.isNotEmpty) {
                                //Zack writes code here
                                FocusScope.of(context).unfocus();
                                uploadMessage(modelClass.value.toString() +
                                    ': ' +
                                    chatController.text);
                                chatController.clear();
                              } else {
                                print(messages);

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.red.shade600,
                                  duration: Duration(seconds: 1),
                                  content: Text(
                                    "Message can't be blank",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ));
                              }
                            },
                            icon: const Icon(Icons.send),
                          )),
                    ),
                  ),
                ],
              ),
            )),
      );
}

/*body: Hero(
                tag: 'message',
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 0.9),
                      child: Material(
                        child: TextField(
                          controller: chatController,
                          decoration: InputDecoration(
                              labelText: 'Chat Here',
                              labelStyle: TextStyle(
                                color: Colors.blue[700],
                              ),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  if (chatController.text.isEmpty) {
                                    getMessages();
                                    print(messages);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.red.shade600,
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                        "Message can't be blank",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ));
                                  } else {
                                    //Zack writes code here
                                    FocusScope.of(context).unfocus();
                                    uploadMessage(chatController.text);
                                    chatController.clear();
                                  }
                                },
                                icon: const Icon(Icons.send),
                              )),
                        ),
                      ),
                    ),
                  ],
                ))*/
