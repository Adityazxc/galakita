import 'package:flutter/material.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/views/invitation/form1.dart';
import 'package:gala_kita/views/invitation/form4.dart';
// import 'package:gala_kita/views/invitation/form3.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/navigations/navigation_bar.dart';
import 'package:gala_kita/views/splash_screen.dart';
// import 'package:gala_kita/views/main_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:gala_kita/views/testing.dart';
import 'package:provider/provider.dart';

void main() async {
  //inisialisasi firebase
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  

  runApp(ChangeNotifierProvider(create: (context)=>FormDataUndanangan(),
  child: MyApp()
  )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Galakita",

      theme: ThemeData(),
      home: FormInvitation4(),
      // home: Testing(),
    );
  }
}
