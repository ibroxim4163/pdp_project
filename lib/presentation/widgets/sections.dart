import 'package:flutter/material.dart';
import 'package:pdp_project/data/repositories/api_repository.dart';
import 'package:pdp_project/data/services/api_service.dart';

import '../../data/constants/app_colors.dart';

class SwitchSection extends StatefulWidget {
  final String firstText;
  final String secondText;
  final ValueNotifier<bool> isSelected;
  final double width;
  const SwitchSection({
    required this.isSelected,
    required this.firstText,
    required this.secondText,
    super.key,
    required this.width,
  });

  @override
  State<SwitchSection> createState() => _HistorySectionsState();
}

class _HistorySectionsState extends State<SwitchSection> {
  late final ApiRepository apiRepository;

  @override
  void initState() {
    apiRepository = ApiRepositoryImp(APIService());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.mainColor,
              ),
              onPressed: () {
                setState(() {
                  widget.isSelected.value = true;
                  apiRepository.getOutputs();
                });
              },
              child: Text(
                widget.firstText,
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
              style: TextButton.styleFrom(
                foregroundColor: AppColors.mainColor,
              ),
              onPressed: () {},
              child: Text(
                widget.secondText,
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
                  width: widget.width,
                  child: ColoredBox(
                    color: widget.isSelected.value
                        ? AppColors.mainColor
                        : AppColors.greyColor,
                  ),
                ),
                SizedBox(
                  height: 3,
                  width: widget.width,
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
