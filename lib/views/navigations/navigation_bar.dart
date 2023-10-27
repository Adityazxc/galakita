import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gala_kita/views/navigations/home_page.dart';
import 'package:gala_kita/views/navigations/profile.dart';
import 'package:gala_kita/views/widgets/greeting_page.dart';

import '../../utils/global.colors.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex =2;
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Center(
        child: Text("Menu Ke 1"),
      ),
      GreetingPage(),
      HomePage(),
      Center(
        child: Text("Menu Ke 4"),
      ),
      ProfilePage(),
    ];
    return Scaffold(
        body: widgets[currentIndex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: GlobalColors.mainColor,
          items: [
            TabItem(icon: Icons.send_sharp, title: 'Sebar'),
            TabItem(icon: Icons.message, title: 'Ucapan'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.rocket, title: 'Paket'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ],
          initialActiveIndex: 2,
          onTap: (int i) {
            setState(() {
              currentIndex = i;
            });
          },
        ));

  }
}
