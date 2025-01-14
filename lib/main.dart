import 'package:flutter/material.dart';
import 'package:getrestapicalldemo/screens/MyImageScreen.dart';

import 'screens/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Get API Call Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent)),
      home: MyImageScreen(),
    );
  }

}