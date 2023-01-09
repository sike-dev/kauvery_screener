import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kauvery_screener/screens/Year_Of_Experience.dart';
import 'package:kauvery_screener/widgets/textField.dart';
import 'package:kauvery_screener/widgets/text_heading.dart';

class NursingReg extends StatefulWidget {
  const NursingReg({super.key});

  @override
  State<NursingReg> createState() => _NursingRegState();
}

class _NursingRegState extends State<NursingReg> {
  final FirstCouncilNamecontroller = TextEditingController();
  final FirstCouncilDatecontroller = TextEditingController();
  final FinalCouncilNamecontroller = TextEditingController();
  final FinalCouncilDatecontroller = TextEditingController();
  final FinalCouncilValiditycontroller = TextEditingController();
  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  text: "Nursing Registration",
                  fontWeight: FontWeight.bold,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            HeadingText(
              text: "First Nursing Registration",
              fontWeight: FontWeight.w700,
              size: 18,
            ),
            SizedBox(
              height: 10,
            ),
            textFeld(
                hintText: "Council Name",
                icon: Icons.app_registration,
                inputType: TextInputType.name,
                maxLines: 3,
                controller: FirstCouncilNamecontroller),
            textFeld(
                hintText: "Date",
                icon: Icons.app_registration,
                inputType: TextInputType.datetime,
                maxLines: 1,
                controller: FirstCouncilNamecontroller),

            //Final Nursing Registration

            HeadingText(
              text: "Final Nursing Registration",
              fontWeight: FontWeight.w700,
              size: 18,
            ),
            SizedBox(
              height: 10,
            ),
            textFeld(
                hintText: "Council Name",
                icon: Icons.app_registration,
                inputType: TextInputType.name,
                maxLines: 3,
                controller: FinalCouncilNamecontroller),
            textFeld(
                hintText: "Date",
                icon: Icons.app_registration,
                inputType: TextInputType.datetime,
                maxLines: 1,
                controller: FinalCouncilNamecontroller),

            textFeld(
                hintText: "Valid Upto",
                icon: Icons.app_registration,
                inputType: TextInputType.datetime,
                maxLines: 1,
                controller: FinalCouncilValiditycontroller),

            if (pickedFile != null)
              Container(
                child: Image.file(File(pickedFile!.path!),
                    width: 200, height: 400, fit: BoxFit.scaleDown),
              ),

            ElevatedButton(
                onPressed: () {
                  selectFile();
                },
                child: Text("Upload registration certificate")),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () {
                  Get.to(Experience());
                },
                child: Text("Continue"))
          ],
        ),
      )),
    );
  }
}
