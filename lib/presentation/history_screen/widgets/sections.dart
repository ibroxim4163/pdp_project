import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';

class HistorySections extends StatefulWidget {
  final ValueNotifier<bool> isSelected;
  const HistorySections({
    required this.isSelected,
    super.key,
  });

  @override
  State<HistorySections> createState() => _HistorySectionsState();
}

class _HistorySectionsState extends State<HistorySections> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  widget.isSelected.value = true;
                });
              },
              child: Text(
                "Input",
                style: TextStyle(
                  fontSize: 17,
                  color: widget.isSelected.value
                      ? AppColors.mainColor
                      : AppColors.greyColor,
                ),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.isSelected.value = false;
                });
              },
              child: Text(
                "Output",
                style: TextStyle(
                  fontSize: 17,
                  color: widget.isSelected.value
                      ? AppColors.greyColor
                      : AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 5,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 3,
                  width: MediaQuery.sizeOf(context).width * .5 - 20,
                  child: ColoredBox(
                    color: widget.isSelected.value
                        ? AppColors.mainColor
                        : AppColors.greyColor,
                  ),
                ),
                SizedBox(
                  height: 3,
                  width: MediaQuery.sizeOf(context).width * .5 - 20,
                  child: ColoredBox(
                    color: widget.isSelected.value
                        ? AppColors.greyColor
                        : AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
