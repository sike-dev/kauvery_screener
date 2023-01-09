import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kauvery_screener/screens/ID_proof.dart';
import 'package:kauvery_screener/screens/Last_page.dart';
import 'package:kauvery_screener/screens/otherProf.dart';
import 'package:kauvery_screener/screens/professional_EdQualification.dart';
import 'package:kauvery_screener/widgets/dob.dart';
import 'package:kauvery_screener/screens/personal_details.dart';
import 'package:kauvery_screener/screens/phone.dart';
import 'package:kauvery_screener/screens/user_information_screen.dart';
import 'package:kauvery_screener/screens/verify.dart';

import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home': (context) => UserInfromationScreen(),
      'id': (context) => IDProof(),
      'persdetails': (context) => PersDetails(),
      'profeducation': (context) => ProfEd(),
      'otherprofed': (context) => otherProf(),
      'lastpage': (context) => LastPage(),
    },
  ));
}
