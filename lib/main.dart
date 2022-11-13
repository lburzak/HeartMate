import 'package:apkainzynierka/main/main_view.dart';
import 'package:apkainzynierka/theme/theme_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: darkTheme, home: MainView());
  }
}
