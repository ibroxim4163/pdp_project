import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF05AF70),
              shape: const StadiumBorder(),
              fixedSize: Size(size.width * 0.944, size.height * 0.059),
            ),
            child: Text(
              "Submit",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter-Regular",
                  ),
            ),
          ),
          SizedBox(height: size.height * 0.019),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1.5,
                  color: Color(0xFF05AF70),
                ),
                fixedSize: Size(size.width * 0.944, size.height * 0.059),
                shape: const StadiumBorder()),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFFFF0000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter-Regular",
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
