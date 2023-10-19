import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/input_screen/input_screen.dart';
import 'package:pdp_project/presentation/page_builder/page_builder.dart';
import 'package:pdp_project/presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageBuilder(),
    );
  }
}