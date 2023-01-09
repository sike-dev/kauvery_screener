import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kauvery_screener/screens/Last_page.dart';
import 'package:kauvery_screener/widgets/textField.dart';
import 'package:kauvery_screener/widgets/text_heading.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  List<TextEditingController> OrganizationNamecontrollers =
      <TextEditingController>[];
  List<TextEditingController> DepartmentNamecontrollers =
      <TextEditingController>[];
  List<TextEditingController> ExpertiseNamecontrollers =
      <TextEditingController>[];
  List<TextEditingController> StartDatecontrollers = <TextEditingController>[];
  List<TextEditingController> EndDatecontrollers = <TextEditingController>[];
  // List<TextEditingController> TotalExperiencecontrollers =
  //     <TextEditingController>[];
  TextEditingController TotalExperiencecontroller = TextEditingController();

  String org_num = '0';
  var items1 = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OrganizationNamecontrollers =
        List.generate(20, (i) => TextEditingController());
    DepartmentNamecontrollers =
        List.generate(20, (i) => TextEditingController());

    ExpertiseNamecontrollers =
        List.generate(20, (i) => TextEditingController());

    StartDatecontrollers = List.generate(20, (i) => TextEditingController());

    EndDatecontrollers = List.generate(20, (i) => TextEditingController());
    // TotalExperiencecontrollers =
    //     List.generate(5, (i) => TextEditingController());
  }

// The argument type 'Function' can't be assigned to the parameter type 'void Function(DateRangePickerSelectionChangedArgs)?'.

  @override
  Widget build(BuildContext context) {
    // List<Function(DateRangePickerSelectionChangedArgs)?> selections =
    //     List.generate(20, (i) => selectionChanged);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadingText(
                  text: "Year of Experience",
                  fontWeight: FontWeight.bold,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    "How many Organizations have\nawarded you with Experience?",
                    overflow: TextOverflow.ellipsis),
                DropdownButton(
                    value: org_num,
                    items: items1.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        org_num = newValue!;
                      });
                    }),
              ],
            ),
            for (var i = 0; i < int.parse(org_num); i++)
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text("Organization" + (i + 1).toString()),
                  SizedBox(
                    height: 5,
                  ),
                  textFeld(
                      hintText: "Name of organization",
                      icon: Icons.business,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      controller: OrganizationNamecontrollers[i]),
                  textFeld(
                      hintText: "Department Name",
                      icon: Icons.business,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      controller: DepartmentNamecontrollers[i]),
                  textFeld(
                      hintText: "Area of Expertise",
                      icon: Icons.business,
                      inputType: TextInputType.name,
                      maxLines: 2,
                      controller: ExpertiseNamecontrollers[i]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child: Text("Start Date"), width: 100),
                      Container(child: Text("End Date"), width: 100),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: TextField(
                              keyboardType: TextInputType.datetime,
                              maxLines: 1,
                              controller: StartDatecontrollers[i]),
                          width: 100),
                      Container(
                        child: TextField(
                            keyboardType: TextInputType.datetime,
                            maxLines: 1,
                            controller: EndDatecontrollers[i]),
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            HeadingText(
                text: "Enter total experience below",
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 15,
            ),
            textFeld(
                hintText: "Total Years of Experience",
                icon: Icons.numbers,
                inputType: TextInputType.number,
                maxLines: 1,
                controller: TotalExperiencecontroller),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(LastPage());
                },
                child: Text("Continue")),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    );
  }
}
