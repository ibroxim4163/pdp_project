import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/balance_bloc.dart';
import '../models/balance_model.dart';
import 'time.dart';

mixin TimeMixin on State<Time> {
  late final TextEditingController fromController;
  late final TextEditingController untilController;
  final ValueNotifier<String> isCorrectDate = ValueNotifier("");
  final formKey = GlobalKey<FormState>();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  @override
  void initState() {
    fromController = TextEditingController();
    untilController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fromController.dispose();
    untilController.dispose();
    super.dispose();
  }

  String? endIsValidate(String? value) {
    if (value != null && value.length < 10) {
      return "Invalid date";
    }
    String formattedString = value!.split("-").reversed.join("-");
    if (DateTime.tryParse(formattedString) == null) {
      return "Date is not valid";
    }
    return null;
  }

  String? startIsValidate(String? value) {
    if (value != null && value.length < 10) {
      return "Invalid date";
    }
    String formattedString = value!.split("-").reversed.join("-");
    if (DateTime.tryParse(formattedString) == null) {
      return "Date is not valid";
    }
    startTime = DateTime.tryParse(formattedString) ?? DateTime.now();
    String end = untilController.text.split("-").reversed.join("-");
    endTime = DateTime.tryParse(end) ?? DateTime.now();
    String boshi = "${startTime.day.toString().padLeft(2, "0")}-"
        "${startTime.month.toString().padLeft(2, "0")}-${startTime.year}";
    fromController.text = boshi;
    String oxiri = "${endTime.day.toString().padLeft(2, "0")}-"
        "${endTime.month.toString().padLeft(2, "0")}-${endTime.year}";
    untilController.text = oxiri;

    if (startTime.isAfter(endTime)) {
      return "start time can not be after end time";
    }

    return null;
  }

  void onSubmitted() {
    if (formKey.currentState!.validate()) {
      widget.controller.jumpToPage(1);
      String from =
          "${startTime.year}-${startTime.month.toString().padLeft(2, "0")}-"
          "${startTime.day.toString().padLeft(2, "0")}";

      String until =
          "${endTime.year}-${endTime.month.toString().padLeft(2, "0")}-"
          "${endTime.day.toString().padLeft(2, "0")}";

      final BalanceModel balanceModel = BalanceModel(
        from: from,
        until: until,
      );
      context.read<BalanceBloc>().add(
            BalanceEvent(balanceModel),
          );
    }
  }
}
