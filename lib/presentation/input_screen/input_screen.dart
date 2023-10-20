import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/input_screen/widget/custom_card.dart';

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
    const AssetImage("assets/icons/food.png"),
    const AssetImage("assets/icons/konselyar.png"),
    const AssetImage("assets/icons/electronic.png"),
    const AssetImage("assets/icons/Xoztavar.png"),
    const AssetImage("assets/icons/Stroyka.png"),
    const AssetImage("assets/icons/calendar_svgrepo.png")
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
