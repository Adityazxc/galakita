import 'package:flutter/material.dart';
import 'package:gala_kita/views/settings/language.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../utils/global.colors.dart';
import '../main_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Akun"),
          backgroundColor: GlobalColors.mainColor,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Container(
                child: const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/bride.png'),
                      radius: 75,
                    ))),
            const SizedBox(height: 35),
            Container(
                child: const Center(
                  child: Text(
                    "Benno Aja",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
            const SizedBox(height: 10),
            Container(
                child: const Center(
                  child: Text(
                    "benno@gmail.com",
                    style: TextStyle(fontSize: 14),
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 50),
              height: 300,
              width: 400,
              child: SettingsList(
                sections: [
                  SettingsSection(
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: const Icon(Icons.language),
                        title: const Text('Bahasa'),
                        value: const Text('Indonesia'),
                        // onPressed: (context) {
                        //   Navigator.of(context)
                        //       .push(MaterialPageRoute(builder: (context) {
                        //     return const Language();
                        //   }));
                        // },
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(Icons.privacy_tip),
                        title: Text('Kebijakan Privasi'),
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(Icons.key),
                        title: const Text('Ganti Password'),
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(Icons.question_mark),
                        title: const Text('Bantuan Galakita'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: GlobalColors.mainColor,
          onPressed: () {
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
              return LoginView();
            }));
          },
          child: const Icon(Icons.logout),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
