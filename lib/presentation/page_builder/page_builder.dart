import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/history_screen/history_screen.dart';

import '../balance_screen/balance_screen.dart';
import '../input_screen/input_screen.dart';
import '../output_screen/output_screen.dart';
import 'custom_bottom_app_bar.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _MainPagesState();
}

class _MainPagesState extends State<PageBuilder> {
  late final PageController controller;

  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPageChanged(int value) {
    controller.animateToPage(
      value,
      duration: const Duration(microseconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomBottomAppBar(
        onPressed: onPageChanged,
      ),
      body: PageView(
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          InputScreen(),
          OutPutScreen(),
          Balance(),
          HistoryScreen(),
        ],
      ),
    );
  }
}
