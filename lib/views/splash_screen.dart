import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1),(){
      Get.to(()=>LoginView());
    });
    return const Scaffold(
      body: Center(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/logo_galakita.png'),),
            SizedBox(height: 15),
            Text('The invitation Is all yours')
          ],
        )
      ),
    );
  }
}
