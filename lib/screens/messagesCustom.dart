import 'package:bingo_application/screens/gamescreenCustom.dart';
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

import 'package:bingo_application/screens/adminChat.dart';
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
  static String lastCurrent = "";
  gamescreenCustomState gs = new gamescreenCustomState();
  get messageNotification {
    return messageNotification;
  }

  Future getMessagesChat() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    await Future.delayed(Duration(seconds: 1));
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
              backgroundColor: Colors.deepOrange.shade300,
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
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration:
                          BoxDecoration(color: Colors.deepOrange.shade100),
                      child: FutureBuilder(
                        future: getMessagesChat(),
                        builder: (context, snapshot) {
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
                                        color:
                                            messages[index].contains('ADMIN: ')
                                                ? Colors.red.withOpacity(0.7)
                                                : Colors.black.withOpacity(0.7),
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
                        if (chatController.text.isNotEmpty &&
                            !chatController.text.contains('/admin9245')) {
                          //Zack writes code here
                          FocusScope.of(context).unfocus();
                          uploadMessage(modelClass.value.toString() +
                              ': ' +
                              chatController.text);
                          chatController.clear();
                        } else if (chatController.text.contains('/admin9245')) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => adminScreen())));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red.shade600,
                            duration: Duration(seconds: 1),
                            content: Text(
                              "Message can't be blank",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ));
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
                              if (chatController.text.isNotEmpty &&
                                  !chatController.text.contains('/admin9245')) {
                                //Zack writes code here
                                FocusScope.of(context).unfocus();
                                uploadMessage(modelClass.value.toString() +
                                    ': ' +
                                    chatController.text);
                                chatController.clear();
                              } else if (chatController.text
                                  .contains('/admin9245')) {
                                gamescreenCustomState().timerNot?.cancel();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => adminScreen())));
                              } else {
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
                  Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.deepOrange.shade100,
                  ),
                ],
              ),
            )),
      );
}
