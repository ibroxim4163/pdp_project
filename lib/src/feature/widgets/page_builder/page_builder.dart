import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/repositories/api_repository.dart';
import '../../../common/services/api_service.dart';
import '../../balance/balance_screen.dart';
import '../../history/bloc/history_bloc.dart';
import '../../history/history_screen.dart';
import '../../input/bloc/input_bloc.dart';
import '../../input/input_screen.dart';
import '../../output/output_screen.dart';
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
        children: [
          BlocProvider(
            create: (context) => InputBloc(
              ApiRepositoryImp(
                APIService(),
              ),
            )..add(const InputPageLoadingEvent()),
            child: const InputScreen(),
          ),
          const OutputScreen(),
          const Balance(),
          BlocProvider(
            create: (context) => HistoryBloc(
              ApiRepositoryImp(
                APIService(),
              ),
            )..add(
                const GetInputsAndOutputsForHistory(),
              ),
            child: const HistoryScreen(),
          ),
        ],
      ),
    );
  }
}
