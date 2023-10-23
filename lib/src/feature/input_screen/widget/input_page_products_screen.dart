import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_colors.dart';
import '../../input/bloc/input_bloc.dart';
import '../../input/widget/input_dialog.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/products_shimmer.dart';
import 'input_search.dart';

class InputPageProducts extends StatelessWidget {
  final int id;
  const InputPageProducts({
    required this.id,
    super.key,
  });

  void openDialog(
    BuildContext context,
    String productName,
  ) {
    final size = MediaQuery.of(context).size;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: SizedBox(
            height: size.height * 0.55,
            child: InputDialog(productName: productName),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: SafeArea(
          child: InputSearch(id: id),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: BlocBuilder<InputBloc, InputPageState>(
          builder: (context, state) {
            if (state.status == InputStatus.loading) {
              return const ProductsShimmer();
            } else {
              return ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => openDialog(
                    context,
                    state.products[index].name,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 10,
                    ),
                    child: Text(
                      state.products[index].name,
                      style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                                fontFamily: "Inter-Regular",
                              ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: state.products.length,
              );
            }
          },
        ),
      ),
    );
  }
}
