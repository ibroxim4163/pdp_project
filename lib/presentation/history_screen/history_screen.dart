import 'package:flutter/material.dart';

import '../../data/constants/app_colors.dart';
import '../widgets/sections.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  ValueNotifier<bool> isSelected = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: SafeArea(
          child: SwitchSection(
            width: MediaQuery.of(context).size.width * 0.5 - 20,
            isSelected: isSelected,
            firstText: "Input",
            secondText: "Output",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
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
                        color: const Color(0xFF05AF70).withOpacity(0.5),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Tualet bumaga elma soft touch (8 sht)",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: "Inter-Regular",
                          ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 8),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "22.01.23",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.mainColor,
                                    fontFamily: "Inter-Regular",
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
