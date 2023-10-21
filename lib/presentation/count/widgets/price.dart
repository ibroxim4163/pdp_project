import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../output_screen/output_screen.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  final count = TextEditingController();
  final price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Tualet bumaga elma soft",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 35),
          TextFormField(
            controller: count,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              helperText: "Count",
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: price,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              helperText: "Price",
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                fixedSize: const Size(350, 60),
                shape: const StadiumBorder()),
            onPressed: () {},
            child: const Text("Submit"),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.5, color: AppColors.mainColor),
                fixedSize: const Size(350, 60),
                shape: const StadiumBorder()),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => const OutPutScreen(),
                ),
              );
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
