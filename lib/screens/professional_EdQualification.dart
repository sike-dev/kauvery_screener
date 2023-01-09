import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kauvery_screener/screens/QualMarks.dart';
import 'package:kauvery_screener/widgets/text_heading.dart';

class ProfEd extends StatefulWidget {
  const ProfEd({super.key});

  @override
  State<ProfEd> createState() => _ProfEdState();
}

class _ProfEdState extends State<ProfEd> {
  String? FirstQualtype;
  String? SecondQualtype;
  String? ThirdQualType;
  String? FourthQualType;
  String? FifthQualType;
  Future addUserProfEdDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'First Qualification': FirstQualtype,
      'Second Qualification': SecondQualtype,
      'Third Qualification': ThirdQualType,
      'Fourth Qualification': FourthQualType,
      'Fifth Qualification': FifthQualType,
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
            HeadingText(
              fontWeight: FontWeight.bold,
              text: " Educational/Professional",
              size: 30,
            ),
            HeadingText(
              fontWeight: FontWeight.bold,
              text: "Qualification",
              size: 30,
            ),
            SizedBox(
              height: 25,
            ),

            //First Qualification
            HeadingText(
              text: "Enter first nursing Qualiffication",
              fontWeight: FontWeight.w700,
              size: 18,
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text("Bsc"),
                  value: "BSc",
                  groupValue: FirstQualtype,
                  onChanged: (value) {
                    setState(() {
                      FirstQualtype = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("GNM"),
                  value: "GNM",
                  groupValue: FirstQualtype,
                  onChanged: (value) {
                    setState(() {
                      FirstQualtype = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("ANM"),
                  value: "ANM",
                  groupValue: FirstQualtype,
                  onChanged: (value) {
                    setState(() {
                      FirstQualtype = value.toString();
                    });
                  },
                ),
              ],
            ),

            //Second Qualification
            FirstQualtype == "BSc"
                ? Column(
                    children: [
                      HeadingText(
                        text: "Enter Second nursing Qualiffication",
                        fontWeight: FontWeight.w700,
                        size: 18,
                      ),
                      RadioListTile(
                        title: Text("MSc"),
                        value: "MSc",
                        groupValue: SecondQualtype,
                        onChanged: (value) {
                          setState(() {
                            SecondQualtype = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("NA"),
                        value: "NA",
                        groupValue: SecondQualtype,
                        onChanged: (value) {
                          setState(() {
                            SecondQualtype = value.toString();
                          });
                        },
                      ),
                    ],
                  )
                : FirstQualtype == "GNM"
                    ? Column(
                        children: [
                          HeadingText(
                            text: "Enter Second nursing Qualiffication",
                            fontWeight: FontWeight.w700,
                            size: 18,
                          ),
                          RadioListTile(
                            title: Text("PCBSC"),
                            value: "PCBSC",
                            groupValue: SecondQualtype,
                            onChanged: (value) {
                              setState(() {
                                SecondQualtype = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text("MSc"),
                            value: "MSc",
                            groupValue: SecondQualtype,
                            onChanged: (value) {
                              setState(() {
                                SecondQualtype = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text("NA"),
                            value: "NA",
                            groupValue: SecondQualtype,
                            onChanged: (value) {
                              setState(() {
                                SecondQualtype = value.toString();
                              });
                            },
                          ),
                        ],
                      )
                    : FirstQualtype == "ANM"
                        ? Column(
                            children: [
                              HeadingText(
                                text: "Enter Second nursing Qualiffication",
                                fontWeight: FontWeight.w700,
                                size: 18,
                              ),
                              RadioListTile(
                                title: Text("GNM"),
                                value: "GNM",
                                groupValue: SecondQualtype,
                                onChanged: (value) {
                                  setState(() {
                                    SecondQualtype = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text("NA"),
                                value: "NA",
                                groupValue: SecondQualtype,
                                onChanged: (value) {
                                  setState(() {
                                    SecondQualtype = value.toString();
                                  });
                                },
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              HeadingText(
                                text: "Enter Second nursing Qualiffication",
                                fontWeight: FontWeight.w700,
                                size: 18,
                              ),
                              RadioListTile(
                                title: Text("NA"),
                                value: "NA",
                                groupValue: SecondQualtype,
                                onChanged: (value) {
                                  setState(() {
                                    SecondQualtype = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),

            //Third Qualification
            SecondQualtype == "MSc"
                ? Column(
                    children: [
                      HeadingText(
                        text: "Enter Third nursing Qualiffication",
                        fontWeight: FontWeight.w700,
                        size: 18,
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: Text("PHD"),
                            value: "PHD",
                            groupValue: ThirdQualType,
                            onChanged: (value) {
                              setState(() {
                                ThirdQualType = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text("NA"),
                            value: "NA",
                            groupValue: ThirdQualType,
                            onChanged: (value) {
                              setState(() {
                                FirstQualtype = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                : SecondQualtype == "PCBSC"
                    ? Column(
                        children: [
                          HeadingText(
                            text: "Enter Third nursing Qualiffication",
                            fontWeight: FontWeight.w700,
                            size: 18,
                          ),
                          Column(
                            children: [
                              RadioListTile(
                                title: Text("MSc"),
                                value: "MSc",
                                groupValue: ThirdQualType,
                                onChanged: (value) {
                                  setState(() {
                                    ThirdQualType = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text("NA"),
                                value: "NA",
                                groupValue: ThirdQualType,
                                onChanged: (value) {
                                  setState(() {
                                    ThirdQualType = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    : SecondQualtype == "ANM"
                        ? Column(
                            children: [
                              HeadingText(
                                text: "Enter Third nursing Qualiffication",
                                fontWeight: FontWeight.w700,
                                size: 18,
                              ),
                              Column(
                                children: [
                                  RadioListTile(
                                    title: Text("MSc"),
                                    value: "MSc",
                                    groupValue: ThirdQualType,
                                    onChanged: (value) {
                                      setState(() {
                                        ThirdQualType = value.toString();
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text("NA"),
                                    value: "NA",
                                    groupValue: ThirdQualType,
                                    onChanged: (value) {
                                      setState(() {
                                        ThirdQualType = value.toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )
                        : FirstQualtype == "ANM" && SecondQualtype == "GNM"
                            ? Column(
                                children: [
                                  HeadingText(
                                    text: "Enter Third nursing Qualiffication",
                                    fontWeight: FontWeight.w700,
                                    size: 18,
                                  ),
                                  Column(
                                    children: [
                                      RadioListTile(
                                        title: Text("PCBSC"),
                                        value: "PCBSC",
                                        groupValue: ThirdQualType,
                                        onChanged: (value) {
                                          setState(() {
                                            ThirdQualType = value.toString();
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text("NA"),
                                        value: "NA",
                                        groupValue: ThirdQualType,
                                        onChanged: (value) {
                                          setState(() {
                                            ThirdQualType = value.toString();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  HeadingText(
                                    text: "Enter Third nursing Qualiffication",
                                    fontWeight: FontWeight.w700,
                                    size: 18,
                                  ),
                                  Column(
                                    children: [
                                      RadioListTile(
                                        title: Text("NA"),
                                        value: "NA",
                                        groupValue: ThirdQualType,
                                        onChanged: (value) {
                                          setState(() {
                                            ThirdQualType = value.toString();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),

            //Fourth Qualification
            (SecondQualtype == "PCBSC" && ThirdQualType == "MSc")
                ? Column(
                    children: [
                      HeadingText(
                        text: "Enter Fourth nursing Qualiffication",
                        fontWeight: FontWeight.w700,
                        size: 18,
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: Text("PHD"),
                            value: "PHD",
                            groupValue: FourthQualType,
                            onChanged: (value) {
                              setState(() {
                                FourthQualType = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text("NA"),
                            value: "NA",
                            groupValue: FourthQualType,
                            onChanged: (value) {
                              setState(() {
                                FourthQualType = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                : FirstQualtype == "ANM" &&
                        SecondQualtype == "GNM" &&
                        ThirdQualType == "PCBSC"
                    ? Column(
                        children: [
                          HeadingText(
                            text: "Enter Fourth nursing Qualiffication",
                            fontWeight: FontWeight.w700,
                            size: 18,
                          ),
                          Column(
                            children: [
                              RadioListTile(
                                title: Text("MSc"),
                                value: "MSc",
                                groupValue: FourthQualType,
                                onChanged: (value) {
                                  setState(() {
                                    FourthQualType = value.toString();
                                  });
                                },
                              ),
                              RadioListTile(
                                title: Text("NA"),
                                value: "NA",
                                groupValue: FourthQualType,
                                onChanged: (value) {
                                  setState(() {
                                    FourthQualType = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          HeadingText(
                            text: "Enter Fourth nursing Qualiffication",
                            fontWeight: FontWeight.w700,
                            size: 18,
                          ),
                          Column(
                            children: [
                              RadioListTile(
                                title: Text("NA"),
                                value: "NA",
                                groupValue: FourthQualType,
                                onChanged: (value) {
                                  setState(() {
                                    FourthQualType = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

            //Fifth Qualification
            FirstQualtype == "ANM" &&
                    SecondQualtype == "GNM" &&
                    ThirdQualType == "PCBSC" &&
                    FourthQualType == "MSc"
                ? Column(
                    children: [
                      HeadingText(
                        text: "Enter Fifth nursing Qualiffication",
                        fontWeight: FontWeight.w700,
                        size: 18,
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: Text("PHD"),
                            value: "PHD",
                            groupValue: FifthQualType,
                            onChanged: (value) {
                              setState(() {
                                FifthQualType = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text("NA"),
                            value: "NA",
                            groupValue: FifthQualType,
                            onChanged: (value) {
                              setState(() {
                                FifthQualType = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      HeadingText(
                        text: "Enter Fifth nursing Qualiffication",
                        fontWeight: FontWeight.w700,
                        size: 18,
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: Text("NA"),
                            value: "NA",
                            groupValue: FifthQualType,
                            onChanged: (value) {
                              setState(() {
                                FifthQualType = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

            //Continue Button
            ElevatedButton(
                onPressed: () {
                  addUserProfEdDetails();
                  Get.to(QualMarks(
                    FirstQual: FirstQualtype,
                    SecondQual: SecondQualtype,
                    ThirdQual: ThirdQualType,
                    FourthQual: FourthQualType,
                    FifthQual: FifthQualType,
                  ));
                },
                child: Text('Continue'))
          ],
        ),
      )),
    );
  }
}
