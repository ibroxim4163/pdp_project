import 'package:flutter/material.dart';
import 'package:pdp_project/data/constants/app_icons.dart';

import 'package:pdp_project/presentation/detailes_screen/widget/custom_text_field.dart';

import 'package:pdp_project/presentation/widgets/product_data.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.controller,
    required this.onPressed,
  });
  final TextEditingController controller;
  final void Function()? onPressed;

  @override
  State<DetailScreen> createState() => _OutPutScreenState();
}

class _OutPutScreenState extends State<DetailScreen> {
  bool showIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(color: Colors.black),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          showIcon = false;
                        });
                      },
                      onChanged: (value) {
                        widget.controller.text = value;
                        setState(() {});
                      },
                      controller: widget.controller,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Color(0xFF05B06E),
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
                            color: Color(0xFF05B06E),
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
                  widget.controller.text.isEmpty
                      ? IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                    Radius.circular(35),
                                  )),
                                  child: SizedBox(
                                    height: 600,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomField(text: "Category"),
                                        CustomField(text: "Name"),
                                        CustomField(text: "Count"),
                                        CustomField(text: "Unit"),
                                        CustomField(text: "Price"),

                                        /// TODO
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.add_circle_outline_sharp,
                            color: Color(0xFF05B06E),
                            size: 30,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomProductData(onPressed: widget.onPressed),
          ],
        ),
      ),
    );
  }
}
