import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kauvery_screener/screens/personal_details.dart';
import 'package:kauvery_screener/widgets/dob.dart';
import 'package:kauvery_screener/widgets/textField.dart';
import 'package:kauvery_screener/widgets/text_heading.dart';

class IDProof extends StatefulWidget {
  const IDProof({super.key});

  @override
  State<IDProof> createState() => _IDProofState();
}

class _IDProofState extends State<IDProof> {
  final formKey = GlobalKey<FormState>();
  String? IDtype;
  PlatformFile? pickedFile;
  PlatformFile? pickedFile2;
  final AadharController = TextEditingController();
  var myage;
  Future addUserageandIDNUmber() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'age': myage, '$IDtype Number': AadharController.text});
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

  Future uploadFile1() async {
    final path =
        'files/${FirebaseAuth.instance.currentUser!.uid}/$IDtype/front';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future uploadFile2() async {
    final path = 'files/${FirebaseAuth.instance.currentUser!.uid}/$IDtype/back';
    final file = File(pickedFile2!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 3.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/ballons.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 15,
              ),
              HeadingText(
                text: "DOB and ID Proof",
                fontWeight: FontWeight.bold,
                size: 30,
                color: Colors.deepPurpleAccent,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 14,
              ),
              HeadingText(
                  text: "Select your birthdate as per records",
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 15,
              ),
              DobID(
                onChanged: (value) {
                  setState(() {
                    myage = value;
                  });
                },
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(top: 20),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          RadioListTile(
                            title: Text("Aadhar"),
                            value: "Aadhar",
                            groupValue: IDtype,
                            onChanged: (value) {
                              setState(() {
                                IDtype = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text("PAN"),
                            value: "Pan card",
                            groupValue: IDtype,
                            onChanged: (value) {
                              setState(() {
                                IDtype = value.toString();
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IDtype != null
                              ? textFeld(
                                  hintText: "Enter $IDtype",
                                  icon: Icons.perm_identity,
                                  inputType: TextInputType.number,
                                  maxLines: 1,
                                  controller: AadharController,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-zA-Z0-9]+$')
                                            .hasMatch(value)) {
                                      return "Enter correct Number";
                                    } else {
                                      return null;
                                    }
                                  })
                              : Container(),
                          // TextFormField(
                          //     controller: AadharController,
                          //     decoration: InputDecoration(
                          //       labelText: "Enter $IDtype",
                          //     ),
                          //     validator: (value) {
                          //       if (value!.isEmpty ||
                          //           !RegExp(r'^[a-zA-Z0-9]+$')
                          //               .hasMatch(value)) {
                          //         return "Enter correct Number";
                          //       } else {
                          //         return null;
                          //       }
                          //     })

                          SizedBox(height: 10),
                        ],
                      ))),
              pickedFile != null
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(6),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1 / 2,
                        child: Image.file(File(pickedFile!.path!),
                            width: 250, fit: BoxFit.scaleDown),
                      ),
                    )
                  : DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(50),
                      child: Image.asset(
                        'assets/image-icon.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.scaleDown,
                      )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   // Get.snackbar("Title", "message",
                  //   //     titleText: Text("title"),
                  //   //     messageText: Text("Textt"),
                  //   //     snackPosition: SnackPosition.BOTTOM);
                  selectFile();
                  // }
                },
                child: Text("Select front part of ID proof"),
              ),
              pickedFile2 != null
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(6),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1 / 2,
                        child: Image.file(File(pickedFile2!.path!),
                            width: 250, fit: BoxFit.scaleDown),
                      ),
                    )
                  : DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(50),
                      child: Image.asset(
                        'assets/image-icon.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.scaleDown,
                      )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   // Get.snackbar("Title", "message",
                  //   //     titleText: Text("title"),
                  //   //     messageText: Text("Textt"),
                  //   //     snackPosition: SnackPosition.BOTTOM);
                  selectFile2();
                  // }
                },
                child: Text("Select back part of ID Proof"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () async {
                  // if (formKey.currentState!.validate()) {
                  //   // Get.snackbar("Title", "message",
                  //   //     titleText: Text("title"),
                  //   //     messageText: Text("Textt"),
                  //   //     snackPosition: SnackPosition.BOTTOM);
                  await addUserageandIDNUmber();
                  await uploadFile1();
                  await uploadFile2();
                  Get.to(PersDetails());
                },
                child: Text("Continue"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
