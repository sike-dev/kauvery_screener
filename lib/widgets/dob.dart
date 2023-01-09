import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kauvery_screener/screens/ID_proof.dart';
import 'package:kauvery_screener/widgets/text_heading.dart';

class DobID extends StatefulWidget {
  final String? person;
  final ValueChanged<String> onChanged;
  const DobID({super.key, this.person, required this.onChanged});

  @override
  State<DobID> createState() => _DobIDState();
}

class _DobIDState extends State<DobID> {
  String birthDate = "";
  int age = -1;
  TextStyle valueTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  TextStyle textTextStyle = TextStyle(
    fontSize: 16,
  );
  TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 6,
      width: MediaQuery.of(context).size.width - 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            children: <Widget>[
              InkWell(
                onTap: () async {
                  DateTime birthDate = await selectDate(context, DateTime.now(),
                      lastDate: DateTime.now());
                  final df = new DateFormat('dd-MMM-yyyy');
                  this.birthDate = df.format(birthDate);
                  this.age = calculateAge(birthDate);

                  setState(() {
                    widget.onChanged(age.toString());
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                      border: Border.all(color: Colors.grey)),
                  padding: EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        " BirthDate : ",
                        style: textTextStyle,
                      ),
                      Text(
                        "$birthDate",
                        style: valueTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Age: ",
                      style: textTextStyle,
                    ),
                    if (age > -1)
                      Text(
                        "$age",
                        style: valueTextStyle,
                      )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  selectDate(BuildContext context, DateTime initialDateTime,
      {required DateTime lastDate}) async {
    Completer completer = Completer();
    String _selectedDateInString;
    showDatePicker(
            context: context,
            initialDate: initialDateTime,
            firstDate: DateTime(1970),
            lastDate: lastDate == null
                ? DateTime(initialDateTime.year + 10)
                : lastDate)
        .then((temp) {
      if (temp == null) return null;
      completer.complete(temp);
      setState(() {});
    });
    return completer.future;
  }
}
