import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/page_builder/page_builder.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Username",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: "Inter-Regular",
                  ),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC0C7C4), width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(26),
                ),
              ),
              hintText: "diordev",
              hintStyle: TextStyle(
                color: Color(0xFFA69090),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Password",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: "Inter-Regular",
                  ),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC0C7C4), width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(26),
                ),
              ),
              counterText: "Forgot password",
              counterStyle: TextStyle(
                color: Color(0xFF05AF70),
              ),
              hintText: "password",
              hintStyle: TextStyle(
                color: Color(0xFFA69090),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 35),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(280, 55),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(26),
                )),
                backgroundColor: const Color(0xFF05AF70),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageBuilder(),
                  ),
                );
              },
              child: Text(
                "Sign In",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
