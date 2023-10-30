import 'package:flutter/material.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/views/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  //inisialisasi firebase
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => FormDataUndanangan(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Galakita",
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
