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
      child: SizedBox(
        height: 140,
        width: 140,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: const Color(0xFF20BC82),
            border: Border.all(
              color: const Color(0xFF05AF70).withOpacity(.3),
              width: 1,
            ),
            boxShadow:  [
               BoxShadow(
                color: const Color(0xFF05AF70).withOpacity(.5),
                blurRadius: 10,
              )
            ],
          ),
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
      ),
    );
  }
}
