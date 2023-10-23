import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../widgets/app_buttons.dart';
import '../../widgets/custom_text_field.dart';

enum Filials {
  pdpCollege("pdp_college", "PDP College"),
  pdpUniversity("pdp_university", "PDP University"),
  pdpJunior("pdp_junior", "PDP Junior"),
  pdpSchool("pdp_school", "PDP School"),
  pdpAcademy("pdp_academy", "PDP Academy");

  final String backend;
  final String frontend;
  const Filials(this.backend, this.frontend);
}

class Filyal extends StatefulWidget {
  const Filyal({super.key});

  @override
  State<Filyal> createState() => _FilyalState();
}

class _FilyalState extends State<Filyal> {
  late final TextEditingController countController;
  final ValueNotifier<String> selectedFilial =
      ValueNotifier(Filials.values.first.backend);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              "Tualet bumaga elma soft touch (8 sht)",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.blackColor,
                    fontFamily: "Inter-Regular",
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        CustomTextField(
          controller: countController,
          text: "Count",
        ),
        const SizedBox(height: 15),
        CustomDropDownButton(selectedFilial: selectedFilial),
        const Spacer(),
        CustomButton(
          onCancelled: () => Navigator.pop(context),
          onSubmitted: () {},
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class CustomDropDownButton extends StatefulWidget {
  final ValueNotifier<String> selectedFilial;
  const CustomDropDownButton({
    required this.selectedFilial,
    super.key,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String filial = Filials.values.first.frontend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.textFieldBorderColor,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(26),
          ),
        ),
        child: Theme(
          data: ThemeData(
            hoverColor: AppColors.whiteColor,
            splashColor: null,
          ),
          child: DropdownButton(
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            dropdownColor: AppColors.whiteColor,
            focusColor: AppColors.whiteColor,
            underline: const SizedBox(),
            isExpanded: true,
            hint: Text(
              filial,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
            items: List.generate(
              5,
              (index) => DropdownMenuItem(
                value: Text(Filials.values[index].frontend),
                child: ListTile(
                  title: Text(Filials.values[index].frontend),
                ),
                onTap: () {
                  setState(
                    () {
                      filial = Filials.values[index].frontend;
                      widget.selectedFilial.value =
                          Filials.values[index].backend;
                    },
                  );
                },
              ),
            ),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
