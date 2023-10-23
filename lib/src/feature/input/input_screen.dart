import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/app_icons.dart';
import '../../common/repositories/api_repository.dart';
import '../../common/services/api_service.dart';
import '../widgets/categories/custom_card.dart';
import '../widgets/category_shimmer.dart';
import 'bloc/input_bloc.dart';
import 'widget/input_page_products_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 45,
          ),
          child: BlocBuilder<InputBloc, InputPageState>(
            builder: (context, state) {
              if (state.status == InputStatus.loading ) {
                return const CustomCategoryShimmer();
              } else {
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => InputBloc(
                                ApiRepositoryImp(
                                  APIService(),
                                ),
                              )..add(
                                  InputPageGetProducts(
                                    state.categories[index].id,
                                  ),
                                ),
                              child: InputPageProducts(
                                id: state.categories[index].id,
                              ),
                            ),
                          ),
                        );
                      },
                      imageUrl: AppIcons.categories[index],
                      text: state.categories[index].title,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
