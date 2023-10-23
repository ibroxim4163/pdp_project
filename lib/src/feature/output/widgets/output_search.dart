import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';

class OutputSearch extends StatelessWidget {
  const OutputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const BackButton(),
        SizedBox(
          width: size.width * .8,
          height: 45,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(26),
                ),
                borderSide: BorderSide(
                  color: Color(0xFF05B06E),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(26),
                ),
                borderSide: BorderSide(
                  color: AppColors.mainColor,
                  width: 1,
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.all(13),
                child: Image(
                  image: AssetImage(AppIcons.loop),
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
