import 'package:flutter/material.dart';
import 'package:todo_app_flutter/materials/loading.dart';
import 'package:todo_app_flutter/screens/add.dart';
import 'package:todo_app_flutter/screens/gamesrules.dart';
import 'package:todo_app_flutter/screens/home.dart';

void main() {
  runApp(
      MaterialApp(

    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home':(context) =>Home(),
      '/add': (context) => Add(),
      '/gr':(context) => GameRules()
    },
  ));
}

