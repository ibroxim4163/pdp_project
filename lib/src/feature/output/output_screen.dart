import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../widgets/categories/categories.dart';
import '../widgets/custom_divider.dart';
import 'widgets/output_dialog.dart';
import 'widgets/output_search.dart';

class OutputScreen extends StatelessWidget {
  const OutputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomCategories(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: const PreferredSize(
                    preferredSize: Size(double.infinity, 70),
                    child: SafeArea(child: OutputSearch()),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: SizedBox(
                                  height: size.height * 0.5,
                                  child: const Filyal(),
                                ),
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          child: Text(
                            "Tualet bumaga elma soft touch (8 sht)",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackColor,
                                  fontFamily: "Inter-Regular",
                                ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const CustomDivider(),
                      itemCount: 20,
                    ),
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
