import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/repositories/api_repository.dart';
import '../../../common/services/api_service.dart';
import '../../input/bloc/input_bloc.dart';
import '../../input/widget/add_product_dialog.dart';

class InputSearch extends StatefulWidget {
  final int id;
  const InputSearch({
    required this.id,
    super.key,
  });

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  bool showIcon = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackButton(color: AppColors.blackColor),
          SizedBox(
            height: 50,
            width: showIcon ? width * .7 : width * .8,
            child: TextField(
              onTap: () {
                setState(() {
                  showIcon = false;
                });
              },
              onChanged: (value) {
                context.read<InputBloc>().add(
                      InputPageSearchEvent(value, widget.id),
                    );
                if (value.isNotEmpty) {
                  setState(() {
                    showIcon = false;
                  });
                } else {
                  setState(() {
                    showIcon = true;
                  });
                }
              },
              decoration: const InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(26),
                  ),
                  borderSide: BorderSide(
                    color: Color(0xFF05B06E),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(26),
                  ),
                  borderSide: BorderSide(
                    color: AppColors.mainColor,
                    width: 1,
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(13),
                  child: Image(
                    image: AssetImage(AppIcons.loop),
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          showIcon
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => BlocProvider(
                        create: (context) => InputBloc(
                          ApiRepositoryImp(APIService()),
                        ),
                        child: const AddProductDialog(),
                      ),
                    ),
                    icon: const Icon(
                      Icons.add_circle_outline_sharp,
                      color: AppColors.mainColor,
                      size: 30,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
