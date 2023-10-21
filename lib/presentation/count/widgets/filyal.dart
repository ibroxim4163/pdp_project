import 'package:flutter/material.dart';
import 'package:pdp_project/presentation/widgets/app_buttons.dart';
import 'package:pdp_project/presentation/widgets/custom_text_field.dart';

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


class Filyal extends StatefulWidget {
  const Filyal({Key? key}) : super(key: key);

  @override
  State<Filyal> createState() => _FilyalState();
}

class _FilyalState extends State<Filyal> {

  late final TextEditingController countController;


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
          child: Text(
            "Tualet bumaga elma soft touch (8 sht)",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontFamily: "Inter-Regular",
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: 15),
        CustomTextField(controller: countController, text: "Count"),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              )
            ),
            child:  ExpansionTile(
              title: Text(Filials.pdpAcademy.frontend),
              children: [
                ListTile(title: Text(Filials.pdpJunior.frontend)),
                ListTile(title: Text(Filials.pdpUniversity.frontend)),
                ListTile(title: Text(Filials.pdpSchool.frontend)),
                ListTile(title: Text(Filials.pdpCollege.frontend))
              ],
            ),
          ),
        ),
        const Spacer(),
        CustomButton(onPressed: () {}),
        const SizedBox(height: 12),
      ],
    );
  }
}
