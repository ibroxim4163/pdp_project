import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/balance_screen/balance_screen.dart';
import 'package:pdp_project/presentation/input_screen/input_screen.dart';
import 'package:pdp_project/presentation/input_screen/widget/bottom_item.dart';
import 'package:pdp_project/presentation/output_screen/output_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: ClipRRect(
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
                    setState(() => currentPage = 0);
                    controller.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.linear,
                    );
                  },
                  currentPage: currentPage,
                  label: "Input",
                  index: 0,
                ),
                BottomItem(
                  onTap: () {
                    setState(()=> currentPage = 1);
                    controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.linear,
                    );
                  },
                  currentPage: currentPage,
                  label: "Output",
                  index: 1,
                ),
                BottomItem(
                  onTap: () {
                    controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.linear,
                    );
                    setState(() => currentPage = 2);
                  },
                  currentPage: currentPage,
                  label: "Balance",
                  index: 2,
                ),
                BottomItem(
                  onTap: () {
                    controller.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.linear,
                    );
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
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const InputScreen(),
          const OutPutScreen(),
          const Balance(),
          Container(height: double.infinity, color: Colors.blue),
        ],
      ),
    );
  }
}
