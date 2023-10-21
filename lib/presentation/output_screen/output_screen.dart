import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/count/widgets/filyal.dart';
import 'package:pdp_project/presentation/detailes_screen/details.dart';
import 'package:pdp_project/presentation/widgets/categories.dart';

enum Filials{
  pdpCollege("pdp_college","PDP College"),
  pdpUniversity("pdp_university","PDP University"),
  pdpJunior("pdp_junior","PDP Junior"),
  pdpSchool("pdp_school","PDP School"),
  pdpAcademy("pdp_academy","PDP Academy");
  final String backend;
  final String frontend;
  const Filials(this.backend,this.frontend);
}



class OutputScreen extends StatefulWidget {
  const OutputScreen({super.key});

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomCategories(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                controller: controller,
                onPressed: () {
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
                          height: size.height * 0.5,
                          child: const Filyal(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
