import 'package:bingo_application/screens/gamescreenCustom.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
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

import 'package:flutter/services.dart';
import 'package:bingo_application/screens/customGameReady.dart';

class messageBoardCustom extends StatefulWidget {
  @override
  messageBoardCustomState createState() => messageBoardCustomState();
}

ModelClass modelClass = GetIt.instance.get<ModelClass>();
FirstPage fs = new FirstPage();

class messageBoardCustomState extends State<messageBoardCustom> {
  ModelClass modelClass = GetIt.instance.get<ModelClass>();
  final apiKey = "AIzaSyChJLKaNpQ5no0pM_wnQtFv0TjVdRS58mc";
  final chatController = TextEditingController();
  // int notMess = gamescreenState.messageNotification;
  customReadyPage cr = new customReadyPage();
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('usernames');
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('messages');
  static List messagesCheck = [];
  static List messages = [];
  static String wave = "reactionWave";
  static String think = "reactionThink";
  static String laugh = "reactionLaugh";
  static String angry = "reactionAngry";
  static String cry = "reactionCry";
  gamescreenCustomState gs = new gamescreenCustomState();
  get messageNotification {
    return messageNotification;
  }

  Future getMessagesChat() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    await Future.delayed(Duration(seconds: 2));
    await FirebaseFirestore.instance
        .collection('messages')
        .doc(cr.getgameKey)
        .collection(cr.getgameKey)
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
        gs.notValue == messages.length.toInt();
      });
    }
  }

  // @override
  // void initState() {
  //   getMessagesChat();
  //   super.initState();
  // }

  @override
  void dispose() {
    super.dispose();
  }

  static bool reactTapped = false;

//Zack also writes code here
  String message = "";

  Future uploadMessage(String message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    this.message = message;

    final refMessages = FirebaseFirestore.instance
        .collection('messages')
        .doc(cr.getgameKey)
        .collection(cr.getgameKey)
        .doc(message);
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
              backgroundColor: Color.fromARGB(255, 241, 189, 251),
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (() {
                    gamescreenCustomState.lastCurrent =
                        gamescreenCustomState.messages[0];
                    setState(() {
                      gamescreenCustomState.messageNotification = 0;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => gamescreenCustom())));
                  }),
                );
              }),
              //automaticallyImplyLeading: true,
            ),
            body: Hero(
              tag: 'messageCustom',
              child: Stack(children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        decoration:
                            BoxDecoration(color: Colors.purple.shade100),
                        child: FutureBuilder(
                          future: getMessagesChat(),
                          builder: (context, snapshot) {
                            return Material(
                              color: Colors.purple.shade100,
                              child: ListView.builder(
                                reverse: true,
                                itemCount: messages.length,
                                itemBuilder: ((context, index) {
                                  return Align(
                                      alignment: messages[index]
                                              .contains('*** ')
                                          ? Alignment.center
                                          : messages[index].contains(modelClass.value + ': ') ||
                                                  messages[index].contains(
                                                      modelClass.value +
                                                          ' waved.') ||
                                                  messages[index].contains(
                                                      modelClass.value +
                                                          ' is thinking.') ||
                                                  messages[index].contains(
                                                      modelClass.value +
                                                          ' is crying.') ||
                                                  messages[index].contains(
                                                      modelClass.value +
                                                          ' laughed.') ||
                                                  messages[index].contains(
                                                      modelClass.value +
                                                          ' is angry.')
                                              ? Alignment.centerRight
                                              : Alignment.centerLeft,
                                      child: GestureDetector(
                                        child: Card(
                                          color: messages[index].contains('*** ') &&
                                                  messages[index]
                                                      .contains(' ***')
                                              ? Colors.transparent
                                              : messages[index].contains(modelClass.value + ': ') ||
                                                      messages[index].contains(
                                                          modelClass.value +
                                                              ' waved.') ||
                                                      messages[index].contains(
                                                          modelClass.value +
                                                              ' is thinking.') ||
                                                      messages[index].contains(
                                                          modelClass.value +
                                                              ' is crying.') ||
                                                      messages[index].contains(
                                                          modelClass.value +
                                                              ' laughed.') ||
                                                      messages[index].contains(modelClass.value + ' is angry.')
                                                  ? Color.fromARGB(255, 176, 197, 255)
                                                  : Color.fromARGB(255, 189, 159, 242),
                                          elevation:
                                              messages[index].contains('*** ')
                                                  ? 0
                                                  : 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: messages[index]
                                                          .contains(modelClass.value +
                                                              ': ') ||
                                                      messages[index].contains(
                                                          modelClass.value +
                                                              ' waved.') ||
                                                      messages[index].contains(
                                                          modelClass.value +
                                                              ' is thinking.') ||
                                                      messages[index].contains(
                                                          modelClass.value +
                                                              ' is crying.') ||
                                                      messages[index].contains(
                                                          modelClass.value +
                                                              ' laughed.') ||
                                                      messages[index].contains(
                                                          modelClass.value + ' is angry.')
                                                  ? BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20.0),
                                                      topRight:
                                                          Radius.circular(20.0),
                                                      bottomLeft:
                                                          Radius.circular(20.0),
                                                      bottomRight: Radius.zero,
                                                    )
                                                  : BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20.0),
                                                      topRight:
                                                          Radius.circular(20.0),
                                                      bottomLeft: Radius.zero,
                                                      bottomRight:
                                                          Radius.circular(20.0),
                                                    )),
                                          child: messages[index]
                                                  .contains('%animation%play')
                                              ? Container(
                                                  height: 135,
                                                  width: 150,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment(
                                                            -0.8, -.9),
                                                        child: Text(
                                                            messages[index].substring(
                                                                0,
                                                                messages[index].lastIndexOf(
                                                                        modelClass.value +
                                                                            ':') +
                                                                    1),
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        .7))),
                                                      ),
                                                      RiveAnimation.asset(
                                                        'assets/Mingeruchi.riv',
                                                        artboard: messages[
                                                                    index]
                                                                .contains(
                                                                    'wave%animation%play')
                                                            ? wave
                                                            : messages[index]
                                                                    .contains(
                                                                        'think%animation%play')
                                                                ? think
                                                                : messages[index]
                                                                        .contains(
                                                                            'laugh%animation%play')
                                                                    ? laugh
                                                                    : messages[index]
                                                                            .contains('angry%animation%play')
                                                                        ? angry
                                                                        : cry,
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ],
                                                  ))
                                              : Container(
                                                  width: messages[index]
                                                              .contains(
                                                                  '*** ') &&
                                                          messages[index]
                                                              .contains(' ***')
                                                      ? 350
                                                      : 200,
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24)),
                                                  child: Text(
                                                    messages[index].contains(
                                                                modelClass.value +
                                                                    ' waved.') ||
                                                            messages[index].contains(
                                                                modelClass.value +
                                                                    ' is thinking.') ||
                                                            messages[index].contains(
                                                                modelClass.value +
                                                                    ' laughed.') ||
                                                            messages[index].contains(
                                                                modelClass.value +
                                                                    ' is crying.') ||
                                                            messages[index].contains(
                                                                modelClass.value +
                                                                    ' is angry.')
                                                        ? messages[index]
                                                            .replaceAll(RegExp('[^A-Za-z  .]'), '')
                                                        : messages[index],
                                                    style: GoogleFonts.quicksand(
                                                        color: messages[index]
                                                                    .contains(
                                                                        '*** ') &&
                                                                messages[index]
                                                                    .contains(
                                                                        ' ***')
                                                            ? Colors.red
                                                                .withOpacity(
                                                                    0.7)
                                                            : Colors.black
                                                                .withOpacity(
                                                                    0.7),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                        ),
                                      ));
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.purple.shade100,
                      child: TextField(
                        controller: chatController,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (value) {
                          if (chatController.text.contains('***')) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red.shade600,
                              duration: Duration(seconds: 1),
                              content: Text(
                                "Cannot use ***'s",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ));
                          }
                          if (chatController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red.shade600,
                              duration: Duration(seconds: 1),
                              content: Text(
                                "Message can't be blank",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ));
                          }
                          if (chatController.text.isNotEmpty &&
                              !chatController.text.contains('/admin9245') &&
                              !chatController.text.contains('*** ') &&
                              !chatController.text.contains(' ***') &&
                              !chatController.text.contains('***')) {
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
                                if (chatController.text.contains('***')) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red.shade600,
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "Cannot use ***'s",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ));
                                }
                                if (chatController.text.isEmpty) {
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
                                }
                                if (chatController.text.isNotEmpty &&
                                    !chatController.text
                                        .contains('/admin9245') &&
                                    !chatController.text.contains('*** ') &&
                                    !chatController.text.contains(' ***') &&
                                    !chatController.text.contains('***')) {
                                  //Zack writes code here
                                  FocusScope.of(context).unfocus();
                                  uploadMessage(modelClass.value.toString() +
                                      ': ' +
                                      chatController.text);
                                  chatController.clear();
                                }
                              },
                              icon: const Icon(Icons.send),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        reactTapped = !reactTapped;
                        print(reactTapped);
                      },
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 450),
                          height: reactTapped == false ? 25 : 80,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.purple.shade100,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Icon(reactTapped == false
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down),
                              ),
                              AnimatedOpacity(
                                opacity: reactTapped == false ? 0 : 1,
                                duration: const Duration(milliseconds: 450),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //Wave
                                      GestureDetector(
                                        onTap: () {
                                          if (reactTapped == true) {
                                            uploadMessage(
                                                modelClass.value.toString() +
                                                    ': ' +
                                                    'wave%animation%play' +
                                                    Random()
                                                        .nextInt(1000)
                                                        .toString());
                                            chatController.clear();
                                            Future.delayed(Duration(seconds: 1),
                                                (() {
                                              uploadMessage(
                                                  modelClass.value.toString() +
                                                      ' ' +
                                                      'waved.' +
                                                      ' ' +
                                                      Random()
                                                          .nextInt(1000)
                                                          .toString());
                                              chatController.clear();
                                              reactTapped = false;
                                              setState(() {});
                                            }));
                                          }
                                        },
                                        child: Container(
                                            height:
                                                reactTapped == false ? 0 : 35,
                                            width:
                                                reactTapped == false ? 0 : 55,
                                            child: RiveAnimation.asset(
                                                'assets/Mingeruchi.riv',
                                                artboard: "iconWave",
                                                animations: [],
                                                stateMachines: [
                                                  'State Machine 1'
                                                ],
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.center)),
                                      ),
                                      //Think
                                      GestureDetector(
                                        onTap: () {
                                          if (reactTapped == true) {
                                            uploadMessage(
                                                modelClass.value.toString() +
                                                    ': ' +
                                                    'think%animation%play' +
                                                    Random()
                                                        .nextInt(1000)
                                                        .toString());
                                            chatController.clear();
                                            Future.delayed(Duration(seconds: 1),
                                                (() {
                                              uploadMessage(
                                                  modelClass.value.toString() +
                                                      ' ' +
                                                      'is thinking.' +
                                                      ' ' +
                                                      Random()
                                                          .nextInt(1000)
                                                          .toString());
                                              chatController.clear();
                                              reactTapped = false;
                                              setState(() {});
                                            }));
                                          }
                                        },
                                        child: Container(
                                            height:
                                                reactTapped == false ? 0 : 35,
                                            width:
                                                reactTapped == false ? 0 : 55,
                                            child: RiveAnimation.asset(
                                                'assets/Mingeruchi.riv',
                                                artboard: "iconThink",
                                                animations: [],
                                                stateMachines: [
                                                  'State Machine 1'
                                                ],
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.center)),
                                      ),
                                      //Laugh
                                      GestureDetector(
                                        onTap: () {
                                          if (reactTapped == true) {
                                            uploadMessage(
                                                modelClass.value.toString() +
                                                    ': ' +
                                                    'laugh%animation%play' +
                                                    Random()
                                                        .nextInt(1000)
                                                        .toString());
                                            chatController.clear();

                                            chatController.clear();
                                            Future.delayed(Duration(seconds: 1),
                                                (() {
                                              uploadMessage(
                                                  modelClass.value.toString() +
                                                      ' ' +
                                                      'laughed.' +
                                                      ' ' +
                                                      Random()
                                                          .nextInt(1000)
                                                          .toString());
                                              reactTapped = false;
                                              setState(() {});
                                            }));
                                          }
                                        },
                                        child: Container(
                                            height:
                                                reactTapped == false ? 0 : 35,
                                            width:
                                                reactTapped == false ? 0 : 55,
                                            child: RiveAnimation.asset(
                                                'assets/Mingeruchi.riv',
                                                artboard: "iconLaugh",
                                                animations: [],
                                                stateMachines: [
                                                  'State Machine 1'
                                                ],
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.center)),
                                      ),
                                      //Angry
                                      GestureDetector(
                                        onTap: () {
                                          if (reactTapped == true) {
                                            uploadMessage(
                                                modelClass.value.toString() +
                                                    ': ' +
                                                    'angry%animation%play' +
                                                    Random()
                                                        .nextInt(1000)
                                                        .toString());
                                            chatController.clear();

                                            chatController.clear();
                                            Future.delayed(Duration(seconds: 1),
                                                (() {
                                              uploadMessage(
                                                  modelClass.value.toString() +
                                                      ' ' +
                                                      'is angry.' +
                                                      ' ' +
                                                      Random()
                                                          .nextInt(1000)
                                                          .toString());
                                              reactTapped = false;
                                              setState(() {});
                                            }));
                                          }
                                        },
                                        child: Container(
                                            height:
                                                reactTapped == false ? 0 : 35,
                                            width:
                                                reactTapped == false ? 0 : 55,
                                            child: RiveAnimation.asset(
                                                'assets/Mingeruchi.riv',
                                                artboard: "iconAngry",
                                                animations: [],
                                                stateMachines: [
                                                  'State Machine 1'
                                                ],
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.center)),
                                      ),
                                      //Cry
                                      GestureDetector(
                                        onTap: () {
                                          if (reactTapped == true) {
                                            uploadMessage(
                                                modelClass.value.toString() +
                                                    ': ' +
                                                    'cry%animation%play' +
                                                    Random()
                                                        .nextInt(1000)
                                                        .toString());
                                            chatController.clear();

                                            chatController.clear();
                                            Future.delayed(Duration(seconds: 1),
                                                (() {
                                              uploadMessage(
                                                  modelClass.value.toString() +
                                                      ' ' +
                                                      'is crying.' +
                                                      ' ' +
                                                      Random()
                                                          .nextInt(1000)
                                                          .toString());
                                              reactTapped = false;
                                              setState(() {});
                                            }));
                                          }
                                        },
                                        child: Container(
                                            height:
                                                reactTapped == false ? 0 : 35,
                                            width:
                                                reactTapped == false ? 0 : 55,
                                            child: RiveAnimation.asset(
                                                'assets/Mingeruchi.riv',
                                                artboard: "iconCry",
                                                animations: [],
                                                stateMachines: [
                                                  'State Machine 1'
                                                ],
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.center)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                // Align(
                //   alignment: Alignment(0, 0),
                //   child: Draggable(

                //     child: Container(
                //       height: 50,
                //       width: 50,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(24),
                //           color: Colors.blue),
                //     ),
                //   ),
                // ),
              ]),
            )),
      );
}
