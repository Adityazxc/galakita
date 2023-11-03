import 'package:flutter/material.dart';
import 'package:gala_kita/views/widgets/button_global.dart';
import 'package:gala_kita/views/widgets/text/text_form_global.dart';

import '../Utils/global.colors.dart';


class SignupView extends StatelessWidget {
  SignupView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Sign up",
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    )),
                const SizedBox(height: 50),
                Text(
                  'Signup to your account ',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),

                //// Email Input
                TextFormGlobal(
                    controller: emailController,
                    text: 'Nama',
                    error: "Nama Website tidak boleh kosong",
                    obscure: false,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                TextFormGlobal(
                    controller: emailController,
                    text: 'Email',
                    error: "Alamat Website tidak boleh kosong",
                    obscure: false,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                TextFormGlobal(
                    controller: emailController,
                    text: 'Telepon',
                    error: "Telepon tidak boleh kosong",
                    obscure: false,
                    textInputType: TextInputType.emailAddress),

                const SizedBox(height: 10),
                //Password Input
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  error: "Password Website tidak boleh kosong",
                  textInputType: TextInputType.text,
                  obscure: true,
                ),

                const SizedBox(height: 10),
                TextFormGlobal(
                    controller: emailController,
                    text: 'Konfirmasi Password',
                    error: "konfirmasi password tidak boleh kosong",
                    obscure: false,
                    textInputType: TextInputType.emailAddress),

                const ButtonGlobal(),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: []),
      ),
    );
  }
}
