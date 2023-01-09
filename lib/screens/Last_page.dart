import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kauvery_screener/APIs/pdf_api.dart';
import 'package:kauvery_screener/widgets/text_heading.dart';

class LastPage extends StatefulWidget {
  const LastPage({super.key});

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  var useruid = FirebaseAuth.instance.currentUser!.uid;
  String myId = '';
  String myUsername = '';
  String myUrlAvatar = '';
  var url;

  void _getdata() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(useruid)
        .snapshots()
        .listen((userData) {
      setState(() {
        myId = userData.data()!['uid'];
        myUsername = userData.data()!['name'];
        myUrlAvatar = userData.data()!['avatarurl'];
      });
    });
    final ref = FirebaseStorage.instance
        .ref()
        .child('files/$useruid/Professional-Education/GNM-certificate');
    url = await ref.getDownloadURL();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeadingText(
                  text: "One Last Step..",
                  fontWeight: FontWeight.bold,
                  size: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                HeadingText(
                    text:
                        "Click on Generate pdf and \nclick on send button\n in Gmail to complete",
                    fontWeight: FontWeight.w700),
                ElevatedButton(
                    onPressed: () async {
                      final pdfFile =
                          await PdfApi.generate(myId, myUsername, url);

                      PdfApi.openFile(pdfFile);
                    },
                    child: Text('Generate pdf')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
