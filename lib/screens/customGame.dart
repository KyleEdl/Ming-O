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
import 'package:bingo_application/screens/customGameDesc.dart';

class customScreen extends StatefulWidget {
  const customScreen({Key? key}) : super(key: key);

  @override
  State<customScreen> createState() => customPage();
}

class customPage extends State<customScreen> {
  static List<TextEditingController> customText =
      List.generate(50, (i) => TextEditingController());
  static List<String> customList = [];
  final FirstPage fp = new FirstPage();
  int cou = 0;
  int i = 0;
  var c = 0;
  var o = 0;
  var isBroken = false;
  Future addCustList(int i, int cout) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final refMessages =
        FirebaseFirestore.instance.collection('CUSTOM').doc(fp.getgameMode);

    refMessages.set({'GAME ID': fp.getgameMode});

    final refMessage = FirebaseFirestore.instance
        .collection('CUSTOM')
        .doc(fp.getgameMode)
        .collection('list')
        .doc(customList[i]);

    await refMessage.set({'CUST LIST': customList[i], 'INDEX': cout});
  }

  get getcustomList {
    return customList;
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  backClear() async {
    cou = 0;
    customList.clear();
    final instance = FirebaseFirestore.instance;
    final batch = instance.batch();
    var collection =
        instance.collection('CUSTOM').doc(fp.getgameMode).collection('list');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
    while (i < customText.length) {
      setState(() {
        customText[i].clear();
      });

      i++;
      if (i == 50) {
        setState(() {
          i = 0;
        });

        break;
      }
    }
  }

  whileChecker() {
    while (c < customText.length) {
      while (o < customText.length) {
        if (customText[c].text == customText[o].text &&
            c != o &&
            customText[c].text.isNotEmpty) {
          isBroken = true;
          customText[o].clear();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red.shade600,
            duration: Duration(seconds: 1),
            content: Text(
              'Cannot have duplicate items!',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ));
          break;
        }
        o++;
      }
      if (isBroken == true) {
        isBroken = false;
        break;
      }
      c++;
    }
    ifChecker();
  }

  ifChecker() {
    if (customText[0].text.isEmpty ||
        customText[1].text.isEmpty ||
        customText[2].text.isEmpty ||
        customText[3].text.isEmpty ||
        customText[4].text.isEmpty ||
        customText[5].text.isEmpty ||
        customText[6].text.isEmpty ||
        customText[7].text.isEmpty ||
        customText[8].text.isEmpty ||
        customText[9].text.isEmpty ||
        customText[10].text.isEmpty ||
        customText[11].text.isEmpty ||
        customText[12].text.isEmpty ||
        customText[13].text.isEmpty ||
        customText[14].text.isEmpty ||
        customText[15].text.isEmpty ||
        customText[16].text.isEmpty ||
        customText[17].text.isEmpty ||
        customText[18].text.isEmpty ||
        customText[19].text.isEmpty ||
        customText[20].text.isEmpty ||
        customText[21].text.isEmpty ||
        customText[22].text.isEmpty ||
        customText[23].text.isEmpty ||
        customText[24].text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red.shade600,
        duration: Duration(seconds: 1),
        content: Text(
          'A required field is empty!',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ));
    } else {
      for (int i = 0; i < 50; i++) {
        if (customText[i].text.isEmpty) {
          print('THIS INDEX IS EMPTY');
          continue;
        } else {
          customList.add(customText[i].text);
          addCustList(i, cou);
          cou++;
          print('tapped');
        }
      }
      Navigator.push(context,
          new MaterialPageRoute(builder: ((context) => customDescScreen())));
    }
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.blue,
            title: Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Text('Tile Creator',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            elevation: 0,
            backgroundColor: Colors.tealAccent.shade400,
            leading: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () {
                      backClear();

                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => FirstScreen()));
                    },
                    icon: Icon(Icons.arrow_back));
              },
            ),
            //automaticallyImplyLeading: true,
          ),
          body: Container(
            color: Colors.tealAccent.shade700,
            child: Stack(children: [
              ListView.builder(
                  itemCount: 50,
                  itemBuilder: ((context, index) {
                    return TextField(
                      textInputAction: TextInputAction.newline,
                      controller: customText[index],
                      maxLength: 30,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      maxLines: 1,
                      style: GoogleFonts.quicksand(
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                          labelText: index < 25 ? '*' : 'Optional',
                          labelStyle: GoogleFonts.quicksand(
                              color: index < 25
                                  ? Colors.red[700]
                                  : Colors.indigo.shade600,
                              fontSize: 20),
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
                    whileChecker();
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
              )
            ]),
          ),
        ),
      ),
    );
  }
}
