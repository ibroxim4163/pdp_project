import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/sign_in_page/widget/custom_text_field.dart';
import 'package:pdp_project/presentation/widgets/sections.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final valueNotifier = ValueNotifier(true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Start .png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, 1),
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(160, 50),
                    topLeft: Radius.elliptical(160, 50),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SwitchSection(
                        width: MediaQuery.of(context).size.width/2-50,
                        isSelected: valueNotifier,
                        firstText: "Sign In",
                        secondText: "Sign Up",
                      ),
                       const SizedBox(height: 40),
                       const CustomTextField(),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, -0.8),
              child: Text(
                "Welcome",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter-Regular",
                    ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.6, -0.73),
              child: Text(
                "Please login with your information",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter-Regular",
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
