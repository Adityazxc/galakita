import 'package:flutter/material.dart';
import 'package:gala_kita/views/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  //inisialisasi firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     title: "Al-quran",

     theme: ThemeData(),
     home: LoginView(),
    //  home: DetailSurah(),
    //  home: Testing(),
    );
  }
}