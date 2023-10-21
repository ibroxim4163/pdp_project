import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.text,
    this.helperText, this.validator
  });

  final String text;
  final String? hintText;
  final String? helperText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7, bottom: 5),
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter-Regular",
                  ),
            ),
          ),
          TextFormField(
            validator: validator,
            decoration: InputDecoration(
              border:  const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC0C7C4), width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(26),
                )
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color(0xFFA69090),
                fontWeight: FontWeight.w500,
                fontFamily: "Inter-Regular",
                fontSize: 13,
              ),
              counterText: helperText,
              isDense: true,
              counterStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color(0xFF05AF70),
                fontSize: 12,
                fontFamily: "Inter-Regular",
                fontWeight: FontWeight.w500,
              )
            ),
          ),
        ],
      ),
    );
  }
}
