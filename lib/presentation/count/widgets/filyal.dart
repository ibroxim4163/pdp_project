import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../output_screen/output_screen.dart';

class Filyal extends StatefulWidget {
  const Filyal({Key? key}) : super(key: key);

  @override
  State<Filyal> createState() => _FilyalState();
}

class _FilyalState extends State<Filyal> {
  final counts = TextEditingController();
  final filyal = TextEditingController();

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
            controller: counts,
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
            controller: filyal,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              helperText: "Filyal",
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
