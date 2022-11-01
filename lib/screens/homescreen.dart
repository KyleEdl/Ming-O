import 'package:bingo_application/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:bingo_application/screens/gamescreen.dart';
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
  // static String myName = "";
  // static String myAbilName = "";
  // @override
  // void initState() {
  //   super.initState();

  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //   ]);
  // }
  final firebaseInit = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Future upload() async {
    await firebaseInit;

    final refUser = FirebaseFirestore.instance
        .collection('usernames')
        .doc(modelClass.value.toUpperCase());
    await refUser.set({'username': modelClass.value.toUpperCase()});
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

  FirstPage();

  Future joinedGame() async {
    await firebaseInit;

    String name = modelClass.value;

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc('ADMIN: $name Has Joined The Game');
    await refMessages.set({
      'username': 'ADMIN',
      'message': 'ADMIN: $name Has Joined The Game',
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

//store name
  ModelClass modelClass = GetIt.instance.get<ModelClass>();

  //controller to keep track of the page we're on
  final PageController _controller = PageController();

  //Submit Button is pressed
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            PageView(
              controller: _controller,
              children: [
                // Page 1
                Container(
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

                //Page 2
//PageView(physics: NeverScrollableScrollPhysics()),
                Container(
                  color: Colors.greenAccent,
                  child: Stack(children: <Widget>[
                    Align(
                        alignment: Alignment(0, -0.5),
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
                                    !textController.text.contains('ADMIN') &&
                                    !textController.text.contains('Admin') &&
                                    !textController.text.contains('admin')) {
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

                                if (textController.text.contains('ADMIN')) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      'Name cannot contain "ADMIN"',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                                if (textController.text.contains('Admin')) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      'Name cannot contain "Admin"',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                                if (textController.text.contains('admin')) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      'Name cannot contain "admin"',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                              },
                              icon: const Icon(Icons.send),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.9),
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
                    )
                  ]),
                ),

                //Page 3
                Container(
                  color: Colors.pink[300],
                  child: Stack(children: <Widget>[
                    Align(
                        alignment: Alignment(0, -0.7),
                        child: Container(
                          child: Text("Select a mode",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.pink[900])),
                        )),
                    Align(
                        alignment: Alignment(0, -0.5),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isFuneral,
                          onChanged: (bool? funeral) {
                            setState(() {
                              isEdl = false;
                              isOma = false;
                              isLaura = false;
                              isRoth = false;
                              isFuneral = funeral;
                              isBar = false;
                              isParty = false;
                            });

                            if (isBar == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red.shade600,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Cannot check while Bar Mode is active",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ));
                            }
                            if (isParty == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red.shade600,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Cannot check while Party Mode is active",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ));
                            }
                          },
                          activeColor: Colors.green.shade200,
                          title: Text(
                            'Funeral Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[900]),
                          ),
                          subtitle: Text(
                              'If you are attending a funeral, click this.'),
                        )),
                    Align(
                        alignment: Alignment(0, -0.25),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isBar,
                          onChanged: (bool? bar) {
                            setState(() {
                              isEdl = false;
                              isOma = false;
                              isLaura = false;
                              isRoth = false;
                              isFuneral = false;
                              isBar = bar;
                              isParty = false;
                            });
                            if (isFuneral == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red.shade600,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Cannot check while Funeral Mode is active",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ));
                            }

                            if (isParty == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red.shade600,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Cannot check while Party Mode is active",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ));
                            }
                          },
                          activeColor: Colors.green.shade200,
                          title: Text(
                            'Bar Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700]),
                          ),
                          subtitle: Text('If you are at the bar, click this.'),
                        )),
                    Align(
                        alignment: Alignment(0, -0.0),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isParty,
                          onChanged: (bool? party) {
                            setState(() {
                              isEdl = false;
                              isOma = false;
                              isLaura = false;
                              isRoth = false;
                              isFuneral = false;
                              isBar = false;
                              isParty = party;
                            });
                            if (isFuneral == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red.shade600,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Cannot check while Funeral Mode is active",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ));
                            }
                            if (isBar == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red.shade600,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  "Cannot check while Bar Mode is active",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ));
                            }
                          },
                          activeColor: Colors.green.shade200,
                          title: GradientText('Party Mode',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              gradientType: GradientType.linear,
                              gradientDirection: GradientDirection.ltr,
                              colors: [
                                Colors.red.shade700,
                                Colors.pink,
                                Colors.purple,
                                Colors.deepPurple,
                                Colors.deepPurple,
                                Colors.indigo,
                                Colors.blue,
                                Colors.lightBlue,
                                Colors.cyan,
                                Colors.teal,
                                Colors.green,
                                Colors.lightGreen,
                                Colors.lime,
                                Colors.yellow,
                                Colors.amber,
                                Colors.orange,
                                Colors.deepOrange,
                              ]),
                          subtitle: Text('If you are at a party, click this.'),
                        )),
                    Align(
                      alignment: Alignment(0, 0.3),
                      child: TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
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
                                if (!textControllerKey.text
                                    .contains('AERFAMILY')) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "Invalid Custom Key",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                                if (textControllerKey.text
                                    .contains('AERFAMILY')) {
                                  setState(() {
                                    isFuneral = false;
                                    isBar = false;
                                    isParty = false;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: ((context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32))),
                                          backgroundColor: Colors.pink[300],
                                          title: Text(
                                            'Family Gathering Mode',
                                            style: GoogleFonts.quicksand(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setState) {
                                            return Stack(
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment(0, -0.9),
                                                    child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      value: isLaura,
                                                      onChanged: (bool? laura) {
                                                        if (isFuneral ==
                                                            false) {
                                                          setState(() {
                                                            isLaura = laura;
                                                          });
                                                        }
                                                        if (isFuneral == true) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
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
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
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
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
                                                            content: Text(
                                                              "Cannot check while Party Mode is active",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ));
                                                        }
                                                      },
                                                      title: Text(
                                                        'Laura is here',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .pink[900]),
                                                      ),
                                                      subtitle: Text(
                                                          'Laura will be in attendance'),
                                                      activeColor:
                                                          Colors.green.shade200,
                                                    )),
                                                Align(
                                                    alignment:
                                                        Alignment(0, -0.6),
                                                    child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      value: isOma,
                                                      onChanged: (bool? oma) {
                                                        if (isFuneral ==
                                                            false) {
                                                          setState(() {
                                                            isOma = oma;
                                                          });
                                                        }
                                                        if (isFuneral == true) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
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
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
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
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
                                                            content: Text(
                                                              "Cannot check while Party Mode is active",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ));
                                                        }
                                                      },
                                                      title: Text(
                                                        'Oma is here',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .pink[900]),
                                                      ),
                                                      subtitle: Text(
                                                          'Oma will be in attendance'),
                                                      activeColor:
                                                          Colors.green.shade200,
                                                    )),
                                                Align(
                                                    alignment:
                                                        Alignment(0, -0.3),
                                                    child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      value: isEdl,
                                                      onChanged: (bool? edl) {
                                                        if (isFuneral ==
                                                            false) {
                                                          setState(() {
                                                            isEdl = edl;
                                                          });
                                                        }
                                                        if (isFuneral == true) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
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
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
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
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
                                                            content: Text(
                                                              "Cannot check while Party Mode is active",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ));
                                                        }
                                                      },
                                                      title: Text(
                                                        'Edls are here',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .pink[900]),
                                                      ),
                                                      subtitle: Text(
                                                          'Heather and David will be in attendance'),
                                                      activeColor:
                                                          Colors.green.shade200,
                                                    )),
                                                Align(
                                                    alignment: Alignment(0, 0),
                                                    child: CheckboxListTile(
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      value: isRoth,
                                                      onChanged: (bool? roth) {
                                                        if (isFuneral ==
                                                            false) {
                                                          setState(() {
                                                            isRoth = roth;
                                                          });
                                                        }
                                                        if (isFuneral == true) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
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
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
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
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade600,
                                                            duration: Duration(
                                                                seconds: 1),
                                                            content: Text(
                                                              "Cannot check while Party Mode is active",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ));
                                                        }
                                                      },
                                                      activeColor:
                                                          Colors.green.shade200,
                                                      title: Text(
                                                        'Rothwells are here',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .pink[900]),
                                                      ),
                                                      subtitle: Text(
                                                          'Diane, Don, or Kathi will be in attendance'),
                                                    )),
                                                Align(
                                                  alignment: Alignment(0, .5),
                                                  child: Material(
                                                      color:
                                                          Colors.pink.shade300,
                                                      child: InkWell(
                                                          splashFactory:
                                                              InkRipple
                                                                  .splashFactory,
                                                          splashColor: Colors
                                                              .teal.shade700
                                                              .withOpacity(0.5),
                                                          highlightColor: Colors
                                                              .teal.shade700
                                                              .withOpacity(0.5),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                                20.0),
                                                          ),
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            _controller
                                                                .nextPage(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                              curve:
                                                                  Curves.easeIn,
                                                            );
                                                          },
                                                          child: Ink(
                                                              height: 65,
                                                              width: 125,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          20.0),
                                                                ),
                                                                color: Colors
                                                                    .teal
                                                                    .shade400,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  'Submit',
                                                                  style: GoogleFonts
                                                                      .quicksand(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        18,
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
                      ),
                    ),
                  ]),
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
                          if (textController.text.contains('ADMIN')) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red.shade600,
                              duration: Duration(seconds: 1),
                              content: Text(
                                'Name cannot contain "ADMIN"',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ));
                          }
                          if (textController.text.isNotEmpty) {
                            gameList gl = new gameList(isLaura, isOma, isEdl,
                                isRoth, isFuneral, isBar, isParty);

                            tileAssignment = gl.tileAssignment;
                            shownDescriptions = gl.shownDescriptions;
                            joinedGame();

                            upload();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => gamescreen())));
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
                          const url =
                              'https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley';

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
