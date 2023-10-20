import 'package:flutter/material.dart';
import 'package:pdp_project/data/constants/app_icons.dart';

class OutPutScreen extends StatelessWidget {
  const OutPutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0, top: 20, right: 13.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  width: 340,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF20BC82),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text(
                            "Search",
                            style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: const Color(0xFF05B06E),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter-Regular",
                            ),
                          ),
                          border: InputBorder.none,
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(14),
                            child: Image(
                              image: AssetImage(AppIcons.loop),
                              height: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    height: 550,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: double.infinity,
                            height: 1.5,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color(0xFF20BC82).withOpacity(.5),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                    const Color(0xFF05AF70).withOpacity(0.5),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            "Tualet bumaga elma soft touch (8 sht)",
                            style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: "Inter-Regular",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
