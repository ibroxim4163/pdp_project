import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.images,
    required this.text,
    this.onPressed,
  });

  final String images;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:   Card(
        elevation: 10,
        shadowColor: const Color(0xFF05AF70).withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(26),
          ),
        ),
        color: const Color.fromARGB(255, 143, 221, 192),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: [
                  const Shadow(
                    color: Colors.green,
                    blurRadius: 3,
                    offset: Offset(0, 0),
                  ),
                  Shadow(
                    color: const Color(0xFF05AF70).withOpacity(.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage(images),
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
