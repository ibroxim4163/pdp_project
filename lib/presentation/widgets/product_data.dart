import 'package:flutter/material.dart';



class CustomProductData extends StatelessWidget {
  final void Function()? onPressed;
  const CustomProductData({super.key,required  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  height: 1.5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFF20BC82).withOpacity(.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF05AF70).withOpacity(0.5),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 100,
            itemBuilder: (context, index) {
              return Center(
                child: GestureDetector(
                  onTap: onPressed,
                  child: Text(
                    "Tualet bumaga elma soft touch (8 sht)",
                    style:
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "Inter-Regular",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
