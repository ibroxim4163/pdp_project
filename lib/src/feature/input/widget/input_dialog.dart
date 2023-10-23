import 'package:flutter/material.dart';
import 'package:pdp_project/src/feature/widgets/app_buttons.dart';
import 'package:pdp_project/src/feature/widgets/custom_text_field.dart';

class InputDialog extends StatefulWidget {
  final String productName;
  const InputDialog({
    required this.productName,
    super.key,
  });

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  late final TextEditingController countController;
  late final TextEditingController priceController;

  @override
  void initState() {
    countController = TextEditingController();
    priceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              widget.productName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontFamily: "Inter-Regular",
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: countController,
            text: "Count",
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: priceController,
            text: "Price",
          ),
          const Spacer(),
          CustomButton(
            onCancelled: () => Navigator.pop(context),
            onSubmitted: () {},
          ),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}
