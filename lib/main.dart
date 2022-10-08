import 'package:flutter/material.dart';
import 'package:bingo_application/screens/homescreen.dart';
import 'package:bingo_application/service_locator.dart';
import 'dart:math';
import 'package:bingo_application/List/lists.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bingo_application/firebase_options.dart';
import 'package:bingo_application/modelclass.dart';
import 'package:get_it/get_it.dart';

Future main() async {
  // Make sure that WidgetsFlutterBinding.ensureInitialized(); is beneath this comment
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    setup();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      );

  MyApp();
  ModelClass modelClass = GetIt.instance.get<ModelClass>();
}
