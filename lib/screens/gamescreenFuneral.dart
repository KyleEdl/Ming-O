import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'package:bingo_application/screens/bingoWin.dart';
import 'package:bingo_application/screens/bingoDie.dart';
import 'package:bingo_application/screens/bingoLost.dart';
import 'package:bingo_application/modelclass.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:bingo_application/panel.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bingo_application/firebase_options.dart';
import 'package:bingo_application/screens/messagesFuneral.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart';

// import 'package:firebase_database/ui/firebase_animated_list.dart';

// import 'package:just_audio/just_audio.dart';

class gamescreenFuneral extends StatefulWidget {
  @override
  gamescreenFuneralState createState() => gamescreenFuneralState();
}

class gamescreenFuneralState extends State<gamescreenFuneral>
    with WidgetsBindingObserver {
  final player = AudioPlayer();
  static int noteRandom = 0;
// List and Currency data
  bool? isLaura;
  bool? isOma;
  bool? isEdl;
  bool? isRoth;
  bool? isFuneral;
  bool? isBar;
  bool? isParty;
  bool? isCustom;
  bool? isUniversal;
  List tileAssignment = [];
  List shownDescriptions = [];
  List newAssignment = [];
  List messageFromClass = messageBoardFuneralState.messages;
  String myName = "";
  String myAbilName = "";

  final firebaseInit = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final FirstPage fp = new FirstPage();
  static int points = 25;
  static int addPointsOne = 25;
  static int addPointsTwo = 25;
  static int addPointsThree = 25;
  static int addPointsFour = 25;
  static int addPointsFive = 25;
  static int addPointsSix = 25;
  static int addPointsSeven = 25;
  static int addPointsEight = 25;
  static int addPointsNine = 25;
  static int addPointsTen = 25;
  static int addPointsEleven = 25;
  static int addPointsTwelve = 25;
  static int addPointsThirteen = 0;
  static int addPointsFourteen = 25;
  static int addPointsFifteen = 25;
  static int addPointsSixteen = 25;
  static int addPointsSeventeen = 25;
  static int addPointsEighteen = 25;
  static int addPointsNineteen = 25;
  static int addPointsTwenty = 25;
  static int addPointsTwentyOne = 25;
  static int addPointsTwentyTwo = 25;
  static int addPointsTwentyThree = 25;
  static int addPointsTwentyFour = 25;
  static int addPointsTwentyFive = 25;
  static int twelveTrue = 1;

  var notValue = messages.length;

//
//
//
//
//ATTACK!!!!!!!!
  static int uncheckSingle = -1;
  static int uncheckTripleOne = -1;
  static int uncheckTripleTwo = -1;
  static int uncheckTripleThree = -1;

  static int checkedTiles = 1;

  Timer? timerFalse;
  static const maxSecondsFalse = 4;
  int secondsFalse = maxSecondsFalse;
  void startTimerFalse() {
    timerFalse = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsFalse > 0) {
        setState(() {
          secondsFalse--;
        });
      } else {
        stopTimerFalse(reset: true);
      }
    });
  }

  void stopTimerFalse({bool reset = true}) {
    if (reset) {
      resetTimerFalse();
    }
    timerFalse?.cancel();
  }

  void resetTimerFalse() async {
    await firebaseInit;
    setState(() {
      secondsFalse = maxSecondsFalse;
    });
  }

  Future attackComplete() async {
    await firebaseInit;
    String name = modelClass.value;

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc('funeral')
        .collection('funeral')
        .doc("ADMIN: $name's Attack Completed");

    await refMessages.set({
      'username': 'ADMIN',
      'message': 'ADMIN: $name Has Sent A Single Attack',
      'created': DateTime.now()
    });
  }

  Future singleAttackSent() async {
    await firebaseInit;
    String name = modelClass.value;

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc('funeral')
        .collection('funeral')
        .doc('ADMIN: $name Has Sent A Single Attack');
    await refMessages.set({
      'username': 'ADMIN',
      'message': 'ADMIN: $name Has Sent A Single Attack',
      'created': DateTime.now()
    });
  }

  Future tripleAttackSent() async {
    await firebaseInit;
    String name = modelClass.value;

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc('funeral')
        .collection('funeral')
        .doc('ADMIN: $name Has Sent A Triple Attack');
    await refMessages.set({
      'username': 'ADMIN',
      'message': 'ADMIN: $name Has Sent A Triple Attack',
      'created': DateTime.now()
    });
  }

  Future deathSent() async {
    await firebaseInit;
    String name = modelClass.value;

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc('funeral')
        .collection('funeral')
        .doc('ADMIN: $name Has Died');
    await refMessages.set({
      'username': 'ADMIN',
      'message': 'ADMIN: $name Has Died',
      'created': DateTime.now()
    });
  }

  Future winSent() async {
    await firebaseInit;
    String name = modelClass.value;

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc('funeral')
        .collection('funeral')
        .doc('ADMIN: $name Got Ming-O!');
    await refMessages.set({
      'username': 'ADMIN',
      'message': 'ADMIN: $name Got Ming-O!',
      'created': DateTime.now()
    });
  }

  static bool tileOnePoints = true;
  static bool tileTwoPoints = true;
  static bool tileThreePoints = true;
  static bool tileFourPoints = true;
  static bool tileFivePoints = true;
  static bool tileSixPoints = true;
  static bool tileSevenPoints = true;
  static bool tileEightPoints = true;
  static bool tileNinePoints = true;
  static bool tileTenPoints = true;
  static bool tileElevenPoints = true;
  static bool tileTwelvePoints = true;
  static bool tileThirteenPoints = true;
  static bool tileFourteenPoints = true;
  static bool tileFifteenPoints = true;
  static bool tileSixteenPoints = true;
  static bool tileSeventeenPoints = true;
  static bool tileEighteenPoints = true;
  static bool tileNineteenPoints = true;
  static bool tileTwentyPoints = true;
  static bool tileTwentyOnePoints = true;
  static bool tileTwentyTwoPoints = true;
  static bool tileTwentyThreePoints = true;
  static bool tileTwentyFourPoints = true;
  static bool tileTwentyFivePoints = true;
  static String lastCurrent = "This Is Empty";
  static bool timerStarter = false;
  bool appActive = true;
  //This is to lock out all users once someone has won the game
  static bool gameLock = false;

  //Timer for using an ability
  static double _opacityTimer = 1;
  static double _opacHM = 0;
  static bool grace = false;
  static double _graceOpac = 0;
  static double _attackOpac = 0.65;
  static List<String> messages = [];

//cooldown timer
  Timer? timer;
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 1), (_) {
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
  attackAni() {
    Future.delayed(Duration(seconds: 1), () {
      abilityStateMachineInput.value = false;
      bandageStateMachineInput.value = false;
    });
  }

//GRACE TIMER

  static Timer? timerGrace;
  static const maxSecondsGrace = 10;
  static int secondsGrace = maxSecondsGrace;
  void startTimerGrace() {
    timerGrace = Timer.periodic(Duration(seconds: 1), (_) {
      Timer(Duration(milliseconds: 20), (() {
        if (secondsGrace > 0 && grace == true) {
          secondsGrace--;
        } else {
          stopTimerGrace();
        }
      }));
    });
  }

  void stopTimerGrace() {
    secondsGrace = maxSecondsGrace;
    timerGrace?.cancel();
    startTimerNot();
    grace = false;

    _graceOpac = 0;
  }

  Timer? timerCompletion;
  static const maxSecondsCompletion = 3;
  static int secondsCompletion = maxSecondsCompletion;
  void startTimerCompletion() {
    timerCompletion = Timer.periodic(Duration(seconds: 1), (_) {
      print('TIMER COMPLETE STARTED');
      attackComplete();
      if (secondsCompletion > 0) {
        secondsCompletion--;
      } else {
        stopTimerCompletion(reset: true);
      }
    });
  }

  void stopTimerCompletion({bool reset = true}) {
    if (reset) {
      resetTimerCompletion();
    }
    timerCompletion?.cancel();
  }

  void resetTimerCompletion() {
    secondsCompletion = maxSecondsCompletion;
  }

  bandageAni() {
    bandageStateMachineInput.value = true;
    _onInit;
    Future.delayed(Duration(seconds: 1), () {
      bandageStateMachineInput.value = false;
      setState(() {
        healthLevel++;
        healthConditions();
        _onInit;
      });
    });
  }

  //Notification Timer

//Page 1 data
  static int tileLockCount = 0;
  static int randThreeLockCount = 0;
  static int bandageCount = 0;
  static bool abilityUseCount = false;
  static double bandageUseCount = 0;
  static int messageNotification = 0;
  //int messageNotNum = 0;
  static int healthLevel = 5;

  static bool fiveHearts = true;
  static bool fourHearts = false;
  static bool threeHearts = false;
  static bool twoHearts = false;
  static bool oneHearts = false;
  static bool zeroHearts = false;
  static bool heartMonitor = false;
  late SMIInput<bool> fiveHeartStateMachineInput;
  late SMIInput<bool> fourHeartStateMachineInput;
  late SMIInput<bool> threeHeartStateMachineInput;
  late SMIInput<bool> twoHeartStateMachineInput;
  late SMIInput<bool> oneHeartStateMachineInput;
  late SMIInput<bool> zeroHeartStateMachineInput;
  late SMIInput<bool> abilityStateMachineInput;
  late SMIInput<bool> bandageStateMachineInput;

  void _onInit(Artboard Idle) {
    print('Hearts Init Running');
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
    zeroHeartStateMachineInput =
        controller.findInput<bool>('zeroHearts') as SMIBool;
    abilityStateMachineInput =
        controller.findInput<bool>('abilityUseCount') as SMIBool;
    bandageStateMachineInput =
        controller.findInput<bool>('bandaidUseCount') as SMIBool;

    if (healthLevel == 5) {
      setState(() {
        fiveHeartStateMachineInput.value = true;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = false;

        zeroHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 4) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = true;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = false;

        zeroHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 3) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = true;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = false;

        zeroHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 2) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = true;

        oneHeartStateMachineInput.value = false;

        zeroHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 1) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = true;

        zeroHeartStateMachineInput.value = false;
      });
    }
    if (healthLevel == 0) {
      setState(() {
        fiveHeartStateMachineInput.value = false;

        fourHeartStateMachineInput.value = false;

        threeHeartStateMachineInput.value = false;

        twoHeartStateMachineInput.value = false;

        oneHeartStateMachineInput.value = false;

        zeroHeartStateMachineInput.value = true;
      });
    }
  }

  gamescreenFuneralState();

  static List<bool> values = List.filled(25, false);
  static List<bool> attackVal = List.filled(25, false);
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

  set setisFuneral(bool? isFuneral) {
    this.isFuneral = isFuneral;
  }

  set settileAssignment(List tileAssignment) {
    this.tileAssignment = tileAssignment;
  }

  set setshownDescriptions(List shownDescriptions) {
    this.shownDescriptions = shownDescriptions;
  }

  set setmessageNotification(int messageNotNum) {
    messageNotification = messageNotNum;
  }

  get getmessageNotification {
    return messageNotification;
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

  get getisFuneral {
    return isFuneral;
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
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _onInit;
    firebaseInit;
    super.initState();
    if (timerStarter == false) {
      timerStarter = true;
      startTimerNot();
    }

    // fiveHeartStateMachineInput.value = true;
    tileTwelve();
    _controller = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState((state));
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) return;

    final isBackground = state == AppLifecycleState.paused;

    if (isBackground) {
      appActive = false;
    } else {
      appActive = true;
    }
  }

//
  tileTwelve() {
    if (twelveTrue == 1) {
      setState(() {
        values[12] = true;
        twelveTrue--;
      });
    }
  }

  singleUncheckMethod() {
    Timer(Duration(milliseconds: 20), (() {
      uncheckSingle = Random().nextInt(25);

      if (values[uncheckSingle.toInt()] == true &&
          checkedTiles >= 1 &&
          grace != true &&
          appActive == true) {
        grace = true;
        Vibration.vibrate(duration: 500);
        startTimerGrace();
        _graceOpac = 1;
        values[uncheckSingle.toInt()] = false;

        attackVal[uncheckSingle.toInt()] = true;

        checkedTiles--;
        healthLevel--;

        healthConditions();
      } else if (checkedTiles == 0 || appActive == false) {
        timerNot?.cancel;
        Future.delayed(Duration(seconds: 1), () {
          startTimerNot();
        });
      } else {
        if (grace != true) {
          singleUncheckMethod();
        }
      }
    }));
  }

  tripleUncheckMethod() {
    Timer(Duration(milliseconds: 20), (() {
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
          checkedTiles >= 3 &&
          grace != true &&
          appActive == true) {
        //spacing this out good lord
        grace = true;
        startTimerGrace();
        _graceOpac = 1;
        values[uncheckTripleOne.toInt()] = false;
        values[uncheckTripleTwo.toInt()] = false;
        values[uncheckTripleThree.toInt()] = false;
        attackVal[uncheckTripleOne.toInt()] = true;
        attackVal[uncheckTripleTwo.toInt()] = true;
        attackVal[uncheckTripleThree.toInt()] = true;

        checkedTiles = checkedTiles - 3;
        Vibration.vibrate(pattern: [250, 500, 250, 500, 250, 1500]);
        healthLevel--;
        healthConditions();
      } else if (checkedTiles <= 2 || appActive == false) {
        timerNot?.cancel();
        Future.delayed(Duration(seconds: 1), () {
          startTimerNot();
        });
      } else {
        if (grace != true) {
          tripleUncheckMethod();
        }
      }
    }));
  }

  healthConditions() {
    if (healthLevel == 5) {
      setState(() {
        fiveHearts == true;
        fourHearts == false;
        threeHearts == false;
        twoHearts == false;
        oneHearts == false;
        zeroHearts == false;

        fiveHeartStateMachineInput.value = true;
        fourHeartStateMachineInput.value = false;
        threeHeartStateMachineInput.value = false;
        twoHeartStateMachineInput.value = false;
        oneHeartStateMachineInput.value = false;

        heartMonitor = false;
      });
    }
    if (healthLevel == 4) {
      setState(() {
        fiveHearts == false;
        fourHearts == true;
        threeHearts == false;
        twoHearts == false;
        oneHearts == false;
        zeroHearts == false;

        fiveHeartStateMachineInput.value = false;
        fourHeartStateMachineInput.value = true;
        threeHeartStateMachineInput.value = false;
        twoHeartStateMachineInput.value = false;
        oneHeartStateMachineInput.value = false;

        heartMonitor = false;
      });
    }
    if (healthLevel == 3) {
      setState(() {
        fiveHearts == false;
        fourHearts == false;
        threeHearts == true;
        twoHearts == false;
        oneHearts == false;
        zeroHearts == false;

        fiveHeartStateMachineInput.value = false;
        fourHeartStateMachineInput.value = false;
        threeHeartStateMachineInput.value = true;
        twoHeartStateMachineInput.value = false;
        oneHeartStateMachineInput.value = false;

        heartMonitor = false;
      });
    }
    if (healthLevel == 2) {
      setState(() {
        fiveHearts == false;
        fourHearts == false;
        threeHearts == false;
        twoHearts == true;
        oneHearts == false;
        zeroHearts == false;

        fiveHeartStateMachineInput.value = false;
        fourHeartStateMachineInput.value = false;
        threeHeartStateMachineInput.value = false;
        twoHeartStateMachineInput.value = true;
        oneHeartStateMachineInput.value = false;

        heartMonitor = false;
      });
    }
    if (healthLevel == 1) {
      setState(() {
        fiveHearts == false;
        fourHearts == false;
        threeHearts == false;
        twoHearts == false;
        oneHearts == true;
        zeroHearts == false;

        fiveHeartStateMachineInput.value = false;
        fourHeartStateMachineInput.value = false;
        threeHeartStateMachineInput.value = false;
        twoHeartStateMachineInput.value = false;
        oneHeartStateMachineInput.value = true;

        heartMonitor = true;
      });
    }

    if (healthLevel <= 0) {
      healthLevel = 0;
      fiveHearts == false;
      fourHearts == false;
      threeHearts == false;
      twoHearts == false;
      oneHearts == false;
      zeroHearts == true;

      fiveHeartStateMachineInput.value = false;
      fourHeartStateMachineInput.value = false;
      threeHeartStateMachineInput.value = false;
      twoHeartStateMachineInput.value = false;
      oneHeartStateMachineInput.value = false;
      zeroHeartStateMachineInput.value = true;

      heartMonitor = true;

      timerNot?.cancel();
      timerGrace?.cancel();
      deathSent();
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => deathScreen())));
      });
    }

    if (healthLevel >= 5) {
      healthLevel = 5;
    }

    if (heartMonitor == true) {
      _opacHM = 0.75;
    }
    if (heartMonitor == false) {
      _opacHM = 0;
    }
  }

  Timer? timerNot;
  static const maxSecondsNot = 2;
  static int secondsNot = maxSecondsNot;
  void startTimerNot() {
    timerNot = Timer.periodic(Duration(seconds: 1), (_) async {
      if (secondsNot > 0) {
        await firebaseInit;
        getMessages();
        checkAttack();
        secondsNot--;
        print('Timer Not:  ' + secondsNot.toString());
      } else {
        stopTimerNot(reset: true);
        getMessages();
        checkAttack();
      }
    });
  }

  Future<void> stopTimerNot({bool reset = true}) async {
    if (reset) {
      await firebaseInit;
      resetTimerNot();
      getMessages();
      checkAttack();
    }
  }

  Future<void> resetTimerNot() async {
    await firebaseInit;
    checkNewMessages();
    secondsNot = maxSecondsNot;
  }

  Future getMessages() async {
    await firebaseInit;
    await Future.delayed(Duration(seconds: 1));
    await FirebaseFirestore.instance
        .collection('messages')
        .doc('funeral')
        .collection('funeral')
        .orderBy('created', descending: true)
        .get()
        .then((snapshot) {
      messages.clear();
      snapshot.docs.forEach((document) {
        messages.add(document.reference.id);
      });
    });

    if (mounted) {
      setState(() {
        messages = messages;
      });
    }
  }

  checkAttack() {
    String name = modelClass.value;
//CHECK THIS PIECE OUT
    if (messages.isNotEmpty) {
      if (messages[0].contains('Has Sent A Single Attack') &&
          !messages[0].contains(name) &&
          messages[0] != lastCurrent) {
        Timer(Duration(milliseconds: 500), (() {
          print('THE ATTACK IS BEING CHECKED FOR SINGLE');
          timerGrace?.cancel();
          timerNot?.cancel();
          singleUncheckMethod();
        }));
      }

      if (messages[0].contains('Has Sent A Triple Attack') &&
          !messages[0].contains(name) &&
          messages[0] != lastCurrent) {
        Timer(Duration(milliseconds: 500), (() {
          print('THE ATTACK IS BEING CHECKED FOR TRIPLE');
          timerGrace?.cancel();
          timerNot?.cancel();
          tripleUncheckMethod();
        }));
      }
      if (messages[0].contains('ADMIN:') &&
          messages[0].contains('Got Ming-O!') &&
          !messages[0].contains(name)) {
        Timer(Duration(milliseconds: 500), (() {
          gameLock == true;
          timerGrace?.cancel();
          timerNot?.cancel();
          Future.delayed(Duration(seconds: 2), () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => loseScreen())));
          });
        }));
      }
    }
  }

  checkNewMessages() {
    if (messages.isNotEmpty) {
      if (lastCurrent != messages[0]) {
        lastCurrent = messages[0];
        messageNotification++;
      }
    }
  }

//messageBoardState().getMessages();
  @override
  Widget build(BuildContext context) {
    final isRunning = timer == null ? false : timer!.isActive;

    final panelHeightOpen = MediaQuery.of(context).size.height * 0.885;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.075;

    final gamescreenFuneralState gs = gamescreenFuneralState();

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
                  (points.toString()
                  //secondsGrace.toString()
                  ),
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
              controller: _controller,
              children: [
                //____________________________________________________________________________________________________________________________________________
                //____________________________________________________________________________________________________________________________________________
                //____________________________________________________________________________________________________________________________________________

                Stack(
                  children: [
                    Container(
                      color: Colors.brown.shade300,
                      child: Align(
                          alignment: Alignment(0, 0.9),
                          child: Container(
                            height: 535,
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
                                      'assets/MingeruchiFUNERAL.riv',
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
                            color: Colors.brown.shade300,
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
                                if (tileLockCount > 0 &&
                                    isRunning == false &&
                                    gameLock == false) {
                                  setState(() {
                                    startTimer();
                                    attackAni();
                                    abilityStateMachineInput.value = true;
                                    tileLockCount--;

                                    singleAttackSent();

                                    Vibration.vibrate(
                                        duration: 5000, intensities: [255]);
                                  });
                                  startTimerCompletion();
                                } else if (tileLockCount <= 0 &&
                                    isRunning == false) {
                                  tileLockCount = 0;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "You are out of single tile uncheckers!",
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
                                  child: RiveAnimation.asset(
                                      'assets/Mingeruchi.riv',
                                      artboard: "singleUncheck",
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
                            color: Colors.brown.shade300,
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
                                    isRunning == false &&
                                    gameLock == false) {
                                  setState(() {
                                    startTimer();
                                    randThreeLockCount--;

                                    tripleAttackSent();

                                    attackAni();
                                    Vibration.vibrate(
                                        duration: 5000, intensities: [255]);
                                    abilityStateMachineInput.value = true;

                                    //test for abilities
                                  });
                                  startTimerCompletion();
                                } else if (randThreeLockCount <= 0 &&
                                    isRunning == false) {
                                  randThreeLockCount = 0;
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "You are out of triple tile uncheckers!",
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
                                  child: RiveAnimation.asset(
                                      'assets/Mingeruchi.riv',
                                      artboard: "tripleUncheck",
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
                            color: Colors.brown.shade300,
                            child: InkWell(
                              splashFactory: InkRipple.splashFactory,
                              splashColor: Colors.red.shade700.withOpacity(0.5),
                              highlightColor:
                                  Colors.red.shade700.withOpacity(0.5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              onLongPress: () {
                                if (healthLevel == 5) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "You are already full health!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                                if (healthLevel <= 4) {
                                  bandageAni();
                                  bandageCount--;
                                }
                                if (healthLevel <= 0) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "There's no saving you! BWAHAHAHAHA!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                              }, //Long Press
                              child: Ink(
                                  height: 65,
                                  width: 125,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: Colors.red.shade400),
                                  child: RiveAnimation.asset(
                                    'assets/MingeruchiFUNERAL.riv',
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
                            child: RiveAnimation.asset(
                              'assets/Mingeruchi.riv',
                              artboard: "hourglass",
                              animations: [],
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.center,
                            )),
                      ),
                    ),
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
                            timerGrace?.cancel();

                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
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
                            timerGrace?.cancel();
                            winSent();
                            timerNot?.cancel();
                          });
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => winScreen())));
                          });
                        }

                        values[index];

                        return GestureDetector(
                          onTap: () async {
                            if (gameLock == false) {
                              setState(() {
                                values[index] = !values[index];
                                attackVal[index] = false;
                              });
                            }
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
                          child: Stack(
                            children: [
                              Container(
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
                              Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: attackVal[index]
                                        ? Colors.red.withOpacity(_attackOpac)
                                        : Colors.transparent,
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.90, 0.75),
                    child: Hero(
                        tag: 'messageFuneral',
                        child: GestureDetector(
                            onTap: () {
                              if (messageNotification > 0) {
                                notOpac == 0;
                                messageNotification = 0;
                              }

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((
                                    context,
                                  ) =>
                                          messageBoardFuneral())));
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
                      alignment: Alignment(0.90, 0.62),
                      child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(notOpac),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            messageNotification.toString(),
                            style: GoogleFonts.quicksand(
                                color: Colors.white.withOpacity(notOpac),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )))),
                  Align(
                    alignment: Alignment(-0.6, .7),
                    child: AnimatedOpacity(
                      opacity: _graceOpac,
                      duration: const Duration(seconds: 1),
                      child: Container(
                          height: 120,
                          width: 120,
                          child: RiveAnimation.asset(
                            'assets/Mingeruchi.riv',
                            artboard: "Angel",
                            animations: [],
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.6, .9),
                    child: AnimatedOpacity(
                      opacity: _opacHM,
                      duration: const Duration(seconds: 1),
                      child: Container(
                          height: 120,
                          width: 120,
                          child: RiveAnimation.asset(
                            'assets/Mingeruchi.riv',
                            artboard: "heartMonitor",
                            animations: [],
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.center,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.4, .75),
                    child: Container(
                      height: 0,
                      width: 0,
                      child: RiveAnimation.asset(
                        'assets/MingeruchiFUNERAL.riv',
                        artboard: "Idle",
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.fitHeight,
                        stateMachines: ['Heartbeat'],
                        onInit: _onInit,
                      ),
                    ),
                  )
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
                                  child: RiveAnimation.asset(
                                      'assets/Mingeruchi.riv',
                                      artboard: "singleUncheck",
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
                                  child: RiveAnimation.asset(
                                      'assets/Mingeruchi.riv',
                                      artboard: "tripleUncheck",
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
                                      'assets/MingeruchiFUNERAL.riv',
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
                    Align(
                      alignment: Alignment(0, .9),
                      child: Container(
                        height: 350,
                        child: RiveAnimation.asset(
                          'assets/Mingeruchi.riv',
                          artboard: "money",
                          alignment: Alignment.center,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
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
