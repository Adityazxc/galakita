import 'package:flutter/material.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/views/invitation/form1.dart';
import 'package:gala_kita/views/navigations/navigation_bar.dart';
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
      home: FormInvitation(),
      // home: Testing(),
    );
  }
}
