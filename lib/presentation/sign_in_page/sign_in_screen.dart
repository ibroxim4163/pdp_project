import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/page_builder/page_builder.dart';
import 'package:pdp_project/presentation/widgets/custom_text_field.dart';
import 'package:pdp_project/presentation/widgets/sections.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final valueNotifier = ValueNotifier(true);
  late final TextEditingController userController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    userController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                height: size.height * 0.659,
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
                  height: size.height * 0.593,
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
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        isSelected: valueNotifier,
                        firstText: "Sign In",
                        secondText: "Sign Up",
                      ),
                      SizedBox(height: size.height * 0.052),
                      CustomTextField(
                        controller: userController,
                        text: "Username",
                        hintText: "diordev",
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        controller: passwordController,
                        text: "Password",
                        hintText: "password",
                        helperText: "Forgot password?",
                      ),
                      SizedBox(height: size.height * 0.026),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PageBuilder(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF05AF70),
                            shape: const StadiumBorder(),
                            fixedSize:
                                Size(size.width * 0.944, size.height * 0.069),
                          ),
                          child: Text(
                            "Sign In",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Inter-Regular",
                                ),
                          ),
                        ),
                      ),
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
