
import 'package:advanced_tips/presentation/shared/resources/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;
  int appstate = 0;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      
    );
  }
}

