import 'package:flutter/material.dart';

import '../input_screen/widget/bottom_item.dart';

class CustomBottomAppBar extends StatefulWidget {
  final Function(int value) onPressed;
  const CustomBottomAppBar({
    required this.onPressed,
    super.key,
  });

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
      child: SizedBox(
        height: 70,
        child: BottomAppBar(
          color: const Color(0xFF20BC82),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomItem(
                onTap: () {
                  widget.onPressed(0);
                  setState(() => currentPage = 0);
                },
                currentPage: currentPage,
                label: "Input",
                index: 0,
              ),
              BottomItem(
                onTap: () {
                   widget.onPressed(1);
                  setState(() => currentPage = 1);
                },
                currentPage: currentPage,
                label: "Output",
                index: 1,
              ),
              BottomItem(
                onTap: () {
                   widget.onPressed(2);
                  setState(() => currentPage = 2);
                },
                currentPage: currentPage,
                label: "Balance",
                index: 2,
              ),
              BottomItem(
                onTap: () {
                   widget.onPressed(3);
                  setState(() => currentPage = 3);
                },
                currentPage: currentPage,
                label: "History",
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
