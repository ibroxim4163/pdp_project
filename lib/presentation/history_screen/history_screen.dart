import 'package:flutter/material.dart';
import '../../data/constants/app_colors.dart';

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
      body: SafeArea(
        child: ListView(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         setState(() {
            //           isSelected.value = true;
            //         });
            //       },
            //       child: Text(
            //         "Input",
            //         style: TextStyle(
            //           fontSize: 17,
            //           color: isSelected.value
            //               ? AppColors.mainColor
            //               : AppColors.greyColor,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 20),
            //     TextButton(
            //       onPressed: () {
            //         setState(() {
            //           isSelected.value = false;
            //         });
            //       },
            //       child: Text(
            //         "Output",
            //         style: TextStyle(
            //           fontSize: 17,
            //           color: !isSelected.value
            //               ? AppColors.mainColor
            //               : AppColors.greyColor,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: SizedBox(
            //     height: 5,
            //     width: double.infinity,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         SizedBox(
            //           height: 3,
            //           width: MediaQuery.sizeOf(context).width * .5 - 20,
            //           child: ColoredBox(
            //             color: isSelected
            //                 ? AppColors.mainColor
            //                 : AppColors.greyColor,
            //           ),
            //         ),
            //         SizedBox(
            //           height: 3,
            //           width: MediaQuery.sizeOf(context).width * .5 - 20,
            //           child: ColoredBox(
            //             color: !isSelected
            //                 ? AppColors.mainColor
            //                 : AppColors.greyColor,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


