import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/repositories/api_repository.dart';
import '../../../common/services/api_service.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/products_shimmer.dart';
import '../bloc/input_bloc.dart';
import 'input_dialog.dart';
import 'input_search.dart';

class InputPageProducts extends StatelessWidget {
  final int id;
  const InputPageProducts({
    required this.id,
    super.key,
  });

  void openDialog({
    required BuildContext context,
    required String productName,
    required int id,
  }) {
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
            child: BlocProvider(
              create: (context) => InputBloc(
                ApiRepositoryImp(
                  APIService(),
                ),
              ),
              child: InputDialog(
                productName: productName,
                id: id,
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
                itemBuilder: (context, index) => Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 1 / 4,
                    children: [
                      SlidableAction(
                        padding: EdgeInsets.zero,
                        onPressed: (context) {
                          context.read<InputBloc>().add(
                                DeleteInputEvent(
                                  categoryId: id,
                                  inputId: state.products[index].id,
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
                          productName: state.products[index].name,
                          id: state.products[index].id,
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
