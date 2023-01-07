import 'package:apkainzynierka/feature/welcome/ui/welcome_view.dart';
import 'package:apkainzynierka/theme/theme_constants.dart';
import 'package:flutter/material.dart';

void main() => testWidget(() => WelcomePageView());

void testWidget(Widget Function() builder) {
  runApp(WidgetTestApp(builder: builder));
}

class WidgetTestApp extends StatelessWidget {
  final Widget Function() builder;

  const WidgetTestApp({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: darkTheme,
        home: Scaffold(
          body: builder(),
        ));
  }
}
