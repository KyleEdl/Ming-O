import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'package:bingo_application/screens/gamescreenBAR.dart';

// ignore: must_be_immutable
class BarPanelWidget extends StatelessWidget {
  final ScrollController controller;
  final FirstPage fp = new FirstPage();
  gamescreenBarState gs = new gamescreenBarState();
  List shownDescriptions = [];
  List tileAssignment = [];
  get gettileAssignment {
    return tileAssignment;
  }

  get getshownDescriptions {
    return shownDescriptions;
  }

  BarPanelWidget(
    List list, {
    Key? key,
    required this.controller,
  }) : super(key: key) {
    shownDescriptions = gs.getshownDescriptions;
    tileAssignment = gs.gettileAssignment;
  }

  set setshownDescriptions(List shownDescriptions) {
    this.shownDescriptions = shownDescriptions;
  }

  set settileAssignment(List tileAssignment) {
    this.tileAssignment = tileAssignment;
  }

  @override
  Widget build(BuildContext context) => ListView(
        controller: controller,
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 36),
          buildDragHandle(),
          buildAboutText(context),
          SizedBox(
            height: 24,
          )
        ],
      );

  Widget buildDragHandle() => Center(
          child: Container(
        width: 30,
        height: 3,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(12)),
      ));

  Widget buildAboutText(BuildContext context) => Container(
        color: Colors.purple.shade200,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[0]),
                                  content: Text(shownDescriptions[0]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[0],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[1]),
                                  content: Text(shownDescriptions[1]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[1],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[2]),
                                  content: Text(shownDescriptions[2]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[2],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[3]),
                                  content: Text(shownDescriptions[3]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[3],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[4]),
                                  content: Text(shownDescriptions[4]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[4],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[5]),
                                  content: Text(shownDescriptions[5]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[5],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[6]),
                                  content: Text(shownDescriptions[6]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[6],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[7]),
                                  content: Text(shownDescriptions[7]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[7],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[8]),
                                  content: Text(shownDescriptions[8]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[8],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[9]),
                                  content: Text(shownDescriptions[9]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[9],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[10]),
                                  content: Text(shownDescriptions[10]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[10],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[11]),
                                  content: Text(shownDescriptions[11]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[11],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[12]),
                                  content: Text(shownDescriptions[12]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[12],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[13]),
                                  content: Text(shownDescriptions[13]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[13],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[14]),
                                  content: Text(shownDescriptions[14]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[14],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[15]),
                                  content: Text(shownDescriptions[15]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[15],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[16]),
                                  content: Text(shownDescriptions[16]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[16],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[17]),
                                  content: Text(shownDescriptions[17]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[17],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[18]),
                                  content: Text(shownDescriptions[18]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[18],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[19]),
                                  content: Text(shownDescriptions[19]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[19],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[20]),
                                  content: Text(shownDescriptions[20]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[20],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[21]),
                                  content: Text(shownDescriptions[21]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[21],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[22]),
                                  content: Text(shownDescriptions[22]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[22],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[23]),
                                  content: Text(shownDescriptions[23]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[23],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
              Material(
                  color: Colors.purple.shade200,
                  child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.purple.shade700.withOpacity(0.5),
                      highlightColor: Colors.purple.shade700.withOpacity(0.5),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  backgroundColor: Colors.green[300],
                                  title: Text(tileAssignment[24]),
                                  content: Text(shownDescriptions[24]),
                                ));
                      },
                      child: Align(
                          alignment: Alignment.center,
                          child: Ink(
                              height: 35,
                              width: 255,
                              child: Text(
                                tileAssignment[24],
                                style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.purple.shade900),
                                textAlign: TextAlign.left,
                              ))))),
              SizedBox(
                height: 20,
              ),
            ]),
      );
}
