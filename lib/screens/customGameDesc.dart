import 'package:bingo_application/modelclass.dart';
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
import 'package:bingo_application/screens/customGame.dart';
import 'package:bingo_application/screens/customGameReady.dart';

class customDescScreen extends StatefulWidget {
  const customDescScreen({Key? key}) : super(key: key);

  @override
  State<customDescScreen> createState() => customDescPage();
}

class customDescPage extends State<customDescScreen> {
  static List<TextEditingController> customTextDesc = [];
  static List customDesc = [];
  var cou = 0;
  var c = 0;
  final FirstPage fp = new FirstPage();
  customPage cg = new customPage();
  List customList = [];
  List customDescList = [];
  set setcustomList(List<String> customList) {
    this.customList = customList;
  }

  customDescPage() {
    settingCustomList();
    customTextDesc =
        List.generate(customList.length, (i) => TextEditingController());
  }

  settingCustomList() {
    customList = cg.getcustomList;
    return customList;
  }

  Future addCustDesc(int i, int cout) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final refMessages = FirebaseFirestore.instance
        .collection('CUSTOM')
        .doc(fp.getgameMode)
        .collection('desc')
        .doc(customDescList[i]);

    print(cout);

    await refMessages.set({'CUST DESC': customDescList[i], 'INDEX': cout});
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          title: Row(
            children: [
              Text('Custom Key: ' + fp.getcustomKey.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.tealAccent.shade400,
          automaticallyImplyLeading: true,
          //automaticallyImplyLeading: true,
        ),
        body: Container(
          color: Colors.tealAccent.shade700,
          child: Stack(children: [
            Container(
              height: 220,
              child: Text(''),
            ),
            ListView.builder(
                itemCount: customList.length,
                itemBuilder: ((context, index) {
                  if (index < 25) {
                    cou = index;
                  }
                  return TextField(
                    textInputAction: TextInputAction.newline,
                    controller: customTextDesc[index],
                    maxLength: 100,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    maxLines: 3,
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        labelText: customList[index],
                        labelStyle: GoogleFonts.quicksand(
                            color: Colors.red[700], fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0))),
                  );
                })),
            Align(
              alignment: Alignment(.87, .8),
              child: GestureDetector(
                onTap: () {
                  if (customTextDesc[cou].text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red.shade600,
                      duration: Duration(seconds: 1),
                      content: Text(
                        'A required field is empty!',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ));
                  } else {
                    for (int i = 0; i < customList.length; i++) {
                      if (customTextDesc[i].text.isEmpty) {
                        print('THIS INDEX IS EMPTY');
                        continue;
                      } else {
                        customDescList.add(customTextDesc[i].text);
                        addCustDesc(i, c);
                        c++;
                        print('tapped');
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => customReadyScreen())));
                  }
                },
                child: Container(
                  height: 60,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade400,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Text(
                    'Next',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green.shade900,
                    ),
                  )),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
