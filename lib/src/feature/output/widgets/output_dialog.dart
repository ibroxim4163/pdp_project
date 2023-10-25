import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdp_project/src/common/models/output_model.dart';
import 'package:pdp_project/src/common/models/product_model.dart';
import 'package:pdp_project/src/feature/output/models/post_output_model.dart';

import '../../../common/constants/app_colors.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/custom_text_field.dart';
import '../bloc/output_bloc.dart';
import 'filial_ddb.dart';

enum Filials {
  pdpAcademy("pdp_academy", "PDP ACADEMY"),
  pdpCollege("pdp_collage", "PDP COLLEGE"),
  pdpUniversity("pdp_university", "PDP UNIVERSITY"),
  pdpJunior("pdp_junior", "PDP JUNIOR"),
  pdpSchool("pdp_school", "PDP SCHOOL");

  final String backend;
  final String frontend;
  const Filials(this.backend, this.frontend);
}

class OutputDialog extends StatefulWidget {
  final ProductModel product;
  const OutputDialog({
    required this.product,
    super.key,
  });

  @override
  State<OutputDialog> createState() => _OutputDialogState();
}

class _OutputDialogState extends State<OutputDialog> {
  late final TextEditingController countController;
  final ValueNotifier<Filials> selectedFilial =
      ValueNotifier(Filials.values.first);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    countController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countController.dispose();
    super.dispose();
  }

  String? validateCount(String? value) {
    if (value != null && value.isEmpty) {
      return "Please write count";
    }
    int count = int.tryParse(value!) ?? 1;
    if (count > widget.product.count) {
      return "There are no $count ${widget.product.name}";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: 3,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.product.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.mainColor,
                        fontFamily: "Inter-Regular",
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "(${widget.product.count.toString()}) count",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: countController,
            validator: validateCount,
            inputFormatter: FilteringTextInputFormatter.allow(
              RegExp(r"[0-9]"),
            ),
            text: "Count",
          ),
          const SizedBox(height: 15),
          CustomDropDownButton(
            selectedFilial: selectedFilial,
          ),
          const Spacer(),
          CustomButton(
            onCancelled: () => Navigator.pop(context),
            onSubmitted: () {
              if (_formKey.currentState!.validate()) {
                int count = int.tryParse(countController.text) ?? 1;
                final PostOutputModel output = PostOutputModel(
                  product: widget.product.id,
                  count: count,
                  filial: selectedFilial.value,
                );
                context.read<OutputBloc>().add(
                      PostOutputEvent(output),
                    );
              }
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
