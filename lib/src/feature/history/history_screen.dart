import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../widgets/custom_divider.dart';
import '../widgets/switch_section.dart';
import 'widgets/custom_history_products.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DateTime date = DateTime.now();
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
      body: ValueListenableBuilder(
        valueListenable: isSelected,
        builder: (context, value, child) {
          if (value) {
            return Padding(
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
                          color: AppColors.dividerColor,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.dividerShadowColor,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: CustomHistoryProducts(
                      productName: "Tualet bumaga elma soft touch (8 sht)",
                      date: date,
                    ),
                  );
                },
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return const CustomDivider();
              },
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: CustomHistoryProducts(
                    productName: "Tualet bumaga elma soft touch (8 sht)",
                    date: date,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
