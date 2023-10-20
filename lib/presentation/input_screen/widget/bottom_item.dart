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
          Text(label),
          const SizedBox(
            height: 8,
          ),
          currentPage == index
              ? Container(
                  color: Colors.white,
                  height: 2,
                  width: 40,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
