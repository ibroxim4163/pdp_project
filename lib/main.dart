import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/balance_screen/balance_screen.dart';

void main() {
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Balance(),
    );
  }
}
