import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kauvery_screener/screens/professional_EdQualification.dart';
import 'package:kauvery_screener/widgets/textField.dart';
import 'package:kauvery_screener/widgets/text_heading.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  PlatformFile? pickedFile;
  PlatformFile? pickedFile2;
  final c10thMarkscontroller = new TextEditingController();
  final c12thMarkscontroller = new TextEditingController();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future selectFile2() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile2 = result.files.first;
    });
  }

  Future uploadFile1() async {
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/10th Marks Card';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future uploadFile2() async {
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/12th Marks Card';
    final file = File(pickedFile2!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future addUserEducationDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'Marks scored in 10th': c10thMarkscontroller.text,
      'Marks scored in 12th': c12thMarkscontroller.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeadingText(
                fontWeight: FontWeight.bold,
                text: "Education",
                size: 30,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          HeadingText(
            text: "10th",
            fontWeight: FontWeight.w700,
            size: 20,
          ),
          SizedBox(
            height: 15,
          ),
          textFeld(
              hintText: "Enter percentage in 10th",
              icon: Icons.numbers,
              inputType: TextInputType.numberWithOptions(decimal: true),
              maxLines: 1,
              controller: c10thMarkscontroller),
          ElevatedButton(
            onPressed: () {
              // if (formKey.currentState!.validate()) {
              //   // Get.snackbar("Title", "message",
              //   //     titleText: Text("title"),
              //   //     messageText: Text("Textt"),
              //   //     snackPosition: SnackPosition.BOTTOM);
              selectFile();
              // }
            },
            child: Text("Select file 1"),
          ),
          if (pickedFile != null)
            Container(
              height: 200,
              child: Image.file(File(pickedFile!.path!),
                  width: double.infinity, fit: BoxFit.scaleDown),
            ),
          SizedBox(
            height: 50,
          ),
          HeadingText(
            text: "12th",
            fontWeight: FontWeight.w700,
            size: 20,
          ),
          SizedBox(
            height: 15,
          ),
          textFeld(
              hintText: "Enter percentage in 12th",
              icon: Icons.numbers,
              inputType: TextInputType.numberWithOptions(decimal: true),
              maxLines: 1,
              controller: c12thMarkscontroller),
          ElevatedButton(
            onPressed: () {
              // if (formKey.currentState!.validate()) {
              //   // Get.snackbar("Title", "message",
              //   //     titleText: Text("title"),
              //   //     messageText: Text("Textt"),
              //   //     snackPosition: SnackPosition.BOTTOM);
              selectFile2();
              // }
            },
            child: Text("Select file 2"),
          ),
          if (pickedFile2 != null)
            Container(
              height: 200,
              child: Image.file(File(pickedFile2!.path!),
                  width: double.infinity, fit: BoxFit.scaleDown),
            ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              addUserEducationDetails();
              uploadFile1();
              uploadFile2();
              // if (formKey.currentState!.validate()) {
              //   // Get.snackbar("Title", "message",
              //   //     titleText: Text("title"),
              //   //     messageText: Text("Textt"),
              //   //     snackPosition: SnackPosition.BOTTOM);
              Get.to(ProfEd());
              // }
            },
            child: Text("Continue"),
          ),
        ]),
      )),
    );
  }
}
