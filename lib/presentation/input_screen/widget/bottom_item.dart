import 'package:flutter/material.dart';

class BottomItem extends StatelessWidget {
  final void Function() onTap;
  final int currentPage;
  final int index;
  final String label;

  const BottomItem({
    super.key,
    required this.onTap,
    required this.currentPage,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
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
          const SizedBox(height: 8),
          currentPage == index
              ? Container(
                  color: Colors.white,
                  height: 2,
                  width: 45,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
