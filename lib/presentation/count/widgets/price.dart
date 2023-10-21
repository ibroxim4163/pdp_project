import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/widgets/app_buttons.dart';
import 'package:pdp_project/presentation/widgets/custom_text_field.dart';


class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
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
          Text(
            "Tualet bumaga elma soft touch (8 sht)",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontFamily: "Inter-Regular",
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 15),
          CustomTextField(controller: countController, text: "Count"),
          const SizedBox(height: 10),
          CustomTextField(controller: priceController, text: "Price"),
          const Spacer(),
          CustomButton(onPressed: () {}),
          const SizedBox(height: 7),
        ],
      ),
    );
  }
}
