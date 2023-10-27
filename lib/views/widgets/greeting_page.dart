import 'package:flutter/material.dart';
import '../../Utils/global.colors.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({Key? key}) : super(key: key);

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30),
          alignment: Alignment.topLeft,
          child: Column(
            //agar tulisan tidak center
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Buku Tamu',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 4),
                Text(
                  'Halo, Selamat Atas Pernikahaannya',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  '20 Maret 2023 17:31',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ),
    );
  }
}