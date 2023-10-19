import 'package:flutter/material.dart';
import 'package:pdp_project/data/constants/app_icons.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SizedBox(
        height: 1000,
        width: 1000,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppIcons.backgroundImages),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
