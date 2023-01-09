import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kauvery_screener/screens/OtherProf.dart';
import 'package:kauvery_screener/widgets/textField.dart';
import 'package:kauvery_screener/widgets/text_heading.dart';

class QualMarks extends StatefulWidget {
  final String? FirstQual;
  final String? SecondQual;
  final String? ThirdQual;
  final String? FourthQual;
  final String? FifthQual;
  const QualMarks({
    super.key,
    required this.FirstQual,
    required this.SecondQual,
    required this.ThirdQual,
    required this.FourthQual,
    required this.FifthQual,
  });

  @override
  State<QualMarks> createState() => _QualMarksState();
}

class _QualMarksState extends State<QualMarks> {
  final FistQualyearcontroller = TextEditingController();
  final SecondQualyearcontroller = TextEditingController();
  final ThirdQualyearcontroller = TextEditingController();
  final FourthQualyearcontroller = TextEditingController();
  final FifthQualyearcontroller = TextEditingController();
  PlatformFile? pickedFile;
  PlatformFile? pickedFile2;
  PlatformFile? pickedFile3;
  PlatformFile? pickedFile4;
  PlatformFile? pickedFile5;

  Future addUserProfMarksDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      widget.FirstQual! + 'Year of Passing': FistQualyearcontroller.text,
      widget.SecondQual! + 'Year of Passing': SecondQualyearcontroller.text,
      widget.ThirdQual! + 'Year of Passing': ThirdQualyearcontroller.text,
      widget.FourthQual! + 'Year of Passing': FourthQualyearcontroller.text,
      widget.FifthQual! + 'Year of Passing': FifthQualyearcontroller.text,
    });
  }

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

  Future selectFile3() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile3 = result.files.first;
    });
  }

  Future selectFile4() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile4 = result.files.first;
    });
  }

  Future selectFile5() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    setState(() {
      pickedFile5 = result.files.first;
    });
  }

  Future uploadFile1() async {
    final Qualpath = widget.FirstQual;
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/Professional-Education/$Qualpath-certificate';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future uploadFile2() async {
    final Qualpath = widget.SecondQual;
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/Professional-Education/$Qualpath-certificate';
    final file = File(pickedFile2!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future uploadFile3() async {
    final Qualpath = widget.ThirdQual;
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/Professional-Education/$Qualpath-certificate';
    final file = File(pickedFile3!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future uploadFile4() async {
    final Qualpath = widget.FourthQual;
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/Professional-Education/$Qualpath-certificate';
    final file = File(pickedFile4!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future uploadFile5() async {
    final Qualpath = widget.FifthQual;
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/Professional-Education/$Qualpath-certificate';
    final file = File(pickedFile5!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadingText(
                      text: "Details about ",
                      fontWeight: FontWeight.bold,
                      size: 30,
                    ),
                  ],
                ),
                HeadingText(
                  text: "Qualifications",
                  fontWeight: FontWeight.bold,
                  size: 30,
                ),
              ],
            ),

            //First qual upload
            widget.FirstQual != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.FirstQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: FistQualyearcontroller),
                      if (pickedFile != null)
                        Container(
                          height: MediaQuery.of(context).size.height * 1 / 4,
                          child: Image.file(File(pickedFile!.path!),
                              width: double.infinity, fit: BoxFit.scaleDown),
                        ),
                      ElevatedButton(
                          onPressed: selectFile,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            //second qual upload
            widget.SecondQual != "NA"
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.SecondQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: SecondQualyearcontroller),
                      if (pickedFile2 != null)
                        Container(
                          height: MediaQuery.of(context).size.height * 1 / 4,
                          child: Image.file(File(pickedFile2!.path!),
                              width: double.infinity, fit: BoxFit.scaleDown),
                        ),
                      ElevatedButton(
                          onPressed: selectFile2,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            //Third qual upload
            widget.ThirdQual != "NA"
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.ThirdQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: ThirdQualyearcontroller),
                      if (pickedFile3 != null)
                        Container(
                          height: MediaQuery.of(context).size.height * 1 / 4,
                          child: Image.file(File(pickedFile3!.path!),
                              width: double.infinity, fit: BoxFit.scaleDown),
                        ),
                      ElevatedButton(
                          onPressed: selectFile3,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            //Fourth Qual upload
            widget.FourthQual != "NA"
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.FourthQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: FourthQualyearcontroller),
                      if (pickedFile4 != null)
                        Container(
                          height: MediaQuery.of(context).size.height * 1 / 4,
                          child: Image.file(File(pickedFile4!.path!),
                              width: double.infinity, fit: BoxFit.scaleDown),
                        ),
                      ElevatedButton(
                          onPressed: selectFile4,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            //Fifth Qual upload

            widget.FifthQual != "NA"
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeadingText(
                        text: widget.FifthQual.toString() + " Details",
                        fontWeight: FontWeight.w700,
                        size: 20,
                      ),
                      textFeld(
                          hintText: "Year of Passing",
                          icon: Icons.school,
                          inputType: TextInputType.number,
                          maxLines: 1,
                          controller: FifthQualyearcontroller),
                      if (pickedFile5 != null)
                        Container(
                          height: MediaQuery.of(context).size.height * 1 / 4,
                          child: Image.file(File(pickedFile5!.path!),
                              width: double.infinity, fit: BoxFit.scaleDown),
                        ),
                      ElevatedButton(
                          onPressed: selectFile3,
                          child: Text("Upload marks card"))
                    ],
                  )
                : Container(),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  addUserProfMarksDetails();
                  uploadFile1();
                  uploadFile2();
                  uploadFile3();
                  uploadFile4();
                  uploadFile5();
                  Get.to(otherProf());
                },
                child: Text("Continue"))
          ],
        ),
      )),
    );
  }
}
