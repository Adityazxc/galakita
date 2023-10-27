import 'package:flutter/material.dart';
import 'package:gala_kita/views/navigations/profile.dart';



class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bahasa"),
        ),
        body: Center(
          child: Text("Ini halaman Bahasa"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ProfilePage();
            }));
          },
          child: Icon(Icons.logout),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}