import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/output_screen/output_screen.dart';
import 'package:pdp_project/presentation/sign_in_page/sign_in_screen.dart';


void main() {
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext  context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
