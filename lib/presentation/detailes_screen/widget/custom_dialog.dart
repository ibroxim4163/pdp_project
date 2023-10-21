import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/widgets/app_buttons.dart';

import '../../widgets/custom_text_field.dart';

Future showCustomDetailsDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final categoryController = TextEditingController();
  final nameController = TextEditingController();
  final countController = TextEditingController();
  final unitController = TextEditingController();
  final priceController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(35),
          ),
        ),
        child: SizedBox(
          height: size.height * 0.791,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                  controller: categoryController,
                  text: "Categoty",
                ),
                CustomTextField(
                  controller: nameController,
                  text: "Name",
                ),
                CustomTextField(
                  controller: countController,
                  text: "Count",
                ),
                CustomTextField(
                  controller: unitController,
                  text: "Unit",
                ),
                CustomTextField(
                  controller: priceController,
                  text: "Price",
                ),
                CustomButton(onPressed: () {}),
              ],
            ),
          ),
        ),
      );
    },
  );
}
