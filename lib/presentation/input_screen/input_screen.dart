import 'package:flutter/material.dart';
import 'package:pdp_project/data/constants/app_icons.dart';
import 'package:pdp_project/presentation/input_screen/widget/custom_card.dart';
import 'package:pdp_project/presentation/output_screen/output_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  List<String> text = [
    "Food",
    "Office",
    "Electronics",
    "Household",
    "Building",
    "Another"
  ];

  List images = [
    AppIcons.cardIcons_1,
    AppIcons.cardIcons_2,
    AppIcons.cardIcons_3,
    AppIcons.cardIcons_4,
    AppIcons.cardIcons_5,
    AppIcons.cardIcons_6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 45),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: text.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return CustomCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OutPutScreen(),
                    ),
                  );
                },
                images: images[index],
                text: text[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
