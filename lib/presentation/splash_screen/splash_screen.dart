import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/page_builder/page_builder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then(
      (value) {
        return Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const PageBuilder(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Start .png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Splash"),
            Text("G7 GROUP CHANNEL"),
          ],
        ),
      ),
    ));
  }
}
