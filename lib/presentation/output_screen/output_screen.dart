import 'package:flutter/material.dart';
import 'package:pdp_project/data/constants/app_icons.dart';

class OutPutScreen extends StatefulWidget {
  const OutPutScreen({super.key});

  @override
  State<OutPutScreen> createState() => _OutPutScreenState();
}

class _OutPutScreenState extends State<OutPutScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                      onChanged: (value) {
                        controller.text = value;
                        setState(() {});
                      },
                      controller: controller,
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
                  controller.text.isEmpty
                      ? IconButton(
                          onPressed: () => {},
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Color(0xFF05B06E),
                            size: 30,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SizedBox(
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
                      child: Text(
                        "Tualet bumaga elma soft touch (8 sht)",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontFamily: "Inter-Regular",
                                ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
