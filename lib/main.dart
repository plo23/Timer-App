/* Copyright (c) 2022, Payton Lo
All rights reserved.

This source code is licensed under the MIT-style license found in the
LICENSE file in the root directory of this source tree.*/
  
// The base of the app was built on a starter app from Flutter.
// Flutter base app can be found at: https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#5

// The popups were inspired from a tutorial by Johannes Milke
// Source code for popups: https://github.com/JohannesMilke/dialog_with_textfield
// Tutorial: https://www.youtube.com/watch?v=D6icsXS8NeA

// Retrieving data from textfields & controller: https://docs.flutter.dev/cookbook/forms/retrieve-input

// Design of timer screen was from doctor code: https://www.youtube.com/watch?v=4Zbf-PS9Q84

// Timer plugin: https://pub.dev/packages/circular_countdown_timer

// Restricting input to numbers: https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter

// Help with dynamically adding to lists: https://googleflutter.com/flutter-add-item-to-listview-dynamically/

import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Timer',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const StudyApp(),
    );
  }
}
