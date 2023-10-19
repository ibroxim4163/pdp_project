import 'package:flutter/material.dart';

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
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF20BC82),
          currentIndex: currentPage,
          onTap: (i) {
            controller.animateToPage(
              i,
              duration: const Duration(microseconds: 100),
              curve: Curves.decelerate,
            );
          },
          items: [
             BottomNavigationBarItem(
              icon: Text(
                "Input",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(color: Colors.green.shade900, blurRadius: 10)
                      ]
                  )
              ),
              label: "",
              backgroundColor: const Color(0xFF20BC82),
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Output",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(color: Colors.green.shade900, blurRadius: 10)
                  ]
                )
              ),
              label: "",
              backgroundColor: const Color(0xFF20BC82),
            ),
             BottomNavigationBarItem(
              icon: Text(
                "Balance",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(color: Colors.green.shade900, blurRadius: 10)
                      ]
                  )
              ),
              label: "",
              backgroundColor: const Color(0xFF20BC82),
            ),
             BottomNavigationBarItem(
              icon: Text(
                "History",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(color: Colors.green.shade900, blurRadius: 10)
                      ]
                  )
              ),
              label: "",
              backgroundColor: Color(0xFF20BC82),
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          currentPage = index;
          setState(() {});
        },
        controller: controller,
        children: [
          Container(height: double.infinity, color: Colors.red),
          Container(height: double.infinity, color: Colors.green),
          Container(height: double.infinity, color: Colors.black),
          Container(height: double.infinity, color: Colors.blue),
        ],
      ),
    );
  }
}
