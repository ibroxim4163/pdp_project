import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/balance_screen/widgets/time.dart';

class Balance extends StatelessWidget {
  const Balance({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
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
                  child: PageView(
                    children: const [
                      Time(),
                      Center(
                        child: Text("World"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}









