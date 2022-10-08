import 'dart:ui';
import 'dart:math';
import 'package:bingo_application/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:bingo_application/screens/gamescreen.dart';
import 'package:get_it/get_it.dart';
import 'package:bingo_application/List/lists.dart';
import 'package:bingo_application/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bingo_application/firebase_options.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => FirstPage();
}

class FirstPage extends State<FirstScreen> {
  final textController = TextEditingController();
  // List bools
  static bool? isLaura = false;
  static bool? isOma = false;
  static bool? isEdl = false;
  static bool? isRoth = false;
  static List tileAssignment = [];
  static List shownDescriptions = [];

  // @override
  // void initState() {
  //   super.initState();

  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //   ]);
  // }

  Future upload() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

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

  get gettileAssignment {
    return tileAssignment;
  }

  get getshownDescriptions {
    return shownDescriptions;
  }

  FirstPage();

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
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
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
                      alignment: Alignment(0, -0.3),
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
                                textController.clear();
                              },
                              icon: const Icon(Icons.clear),
                            )),
                      ),
                    ),
                    Align(
                        alignment: Alignment(0, -.01),
                        child: MaterialButton(
                          color: Colors.green[700],
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            modelClass.value = textController.text;

                            if (textController.text.isNotEmpty) {
                              setState(() {
                                print('You did it!');
                              });
                              _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            }
                            if (textController.text.isEmpty) {
                              setState(() {
                                print('Please enter name');
                              });
                            }
                          },
                        )),
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
                          child: Text("Select all that apply...",
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
                          value: isLaura,
                          onChanged: (bool? laura) {
                            setState(() {
                              isLaura = laura;
                            });
                          },
                          title: Text(
                            'Laura is here',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900]),
                          ),
                          subtitle: Text('Laura will be in attendance'),
                          activeColor: Colors.green.shade200,
                        )),
                    Align(
                        alignment: Alignment(0, -0.35),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isOma,
                          onChanged: (bool? oma) {
                            setState(() {
                              isOma = oma;
                            });
                          },
                          title: Text(
                            'Oma is here',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900]),
                          ),
                          subtitle: Text('Oma will be in attendance'),
                          activeColor: Colors.green.shade200,
                        )),
                    Align(
                        alignment: Alignment(0, -0.2),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isEdl,
                          onChanged: (bool? edl) {
                            setState(() {
                              isEdl = edl;
                            });
                          },
                          title: Text(
                            'Heather and David are here',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900]),
                          ),
                          subtitle:
                              Text('Heather and David will be in attendance'),
                          activeColor: Colors.green.shade200,
                        )),
                    Align(
                        alignment: Alignment(0, -0.05),
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isRoth,
                          onChanged: (bool? roth) {
                            setState(() {
                              isRoth = roth;
                            });
                          },
                          activeColor: Colors.green.shade200,
                          title: Text(
                            'Rothwells are here',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink[900]),
                          ),
                          subtitle: Text(
                              'Diane, Don, or Kathi will be in attendance'),
                        )),
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
                            print('NO!');
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red.shade600,
                              duration: Duration(seconds: 1),
                              content: Text(
                                'Username is required to continue...',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ));
                          }
                          if (textController.text.isNotEmpty) {
                            gameList gl =
                                new gameList(isLaura, isOma, isEdl, isRoth);

                            tileAssignment = gl.tileAssignment;
                            shownDescriptions = gl.shownDescriptions;
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
/*Navigator.push(
              context, MaterialPageRoute(builder: ((context) => gamescreen())));*/

              //deep orange
              //pink600
              //purpleAccent.shade400
              //cyan400