import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/models/product_model.dart';
import '../../../common/services/api_service.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/products_shimmer.dart';
import '../bloc/output_bloc.dart';
import '../repository/output_repository.dart';
import 'output_dialog.dart';
import 'output_search.dart';

class OutputPageProducts extends StatelessWidget {
  final int id;
  const OutputPageProducts({
    required this.id,
    super.key,
  });

  void openDialog({
    required BuildContext context,
    required ProductModel product,
  }) {
    final size = MediaQuery.sizeOf(context);
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
            child: BlocProvider(
              create: (context) => OutputBloc(
                OutputRepositoryImp(
                  APIService(),
                ),
              ),
              child: OutputDialog(
                product: product,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: SafeArea(
          child: OutputSearch(id: id),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: BlocBuilder<OutputBloc, OutputState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is OutputLoadingState) {
              return const ProductsShimmer();
            } else {
              return ListView.separated(
                itemBuilder: (context, index) => Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 1 / 4,
                    children: [
                      SlidableAction(
                        padding: EdgeInsets.zero,
                        onPressed: (context) {
                          context.read<OutputBloc>().add(
                                DeleteOutputEvent(
                                  categoryId: id,
                                  outputId: state.products[index].id,
                                ),
                              );
                        },
                        backgroundColor: AppColors.redColor,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        flex: 1,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        title: Text(
                          state.products[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blackColor,
                                    fontFamily: "Inter-Regular",
                                  ),
                        ),
                        onTap: () => openDialog(
                          context: context,
                          product: state.products[index],
                        ),
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
