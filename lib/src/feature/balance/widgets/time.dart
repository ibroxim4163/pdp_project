import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../common/constants/app_colors.dart';

class Time extends StatefulWidget {
  final PageController controller;
  const Time({
    required this.controller,
    super.key,
  });

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late final TextEditingController fromController;
  late final TextEditingController untilController;
  @override
  void initState() {
    fromController = TextEditingController();
    untilController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fromController.dispose();
    untilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Balance",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 35),
          TextFormField(
            inputFormatters: [
              MaskTextInputFormatter(mask: "##-##-####"),
            ],
            controller: fromController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              helperText: "From",
              hintText: "dd-mm-yyyy",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            inputFormatters: [
              MaskTextInputFormatter(mask: "##-##-####"),
            ],
            controller: untilController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              helperText: "Until",
              hintText: "dd-mm-yyyy",
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                fixedSize: const Size(350, 60),
                shape: const StadiumBorder()),
            onPressed: () {
              widget.controller.jumpToPage(1);
            },
            child: const Text("Submit"),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1.5,
                  color: AppColors.mainColor,
                ),
                fixedSize: const Size(350, 60),
                shape: const StadiumBorder()),
            onPressed: () {
              fromController.text = "";
              untilController.text = "";
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: AppColors.redColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
