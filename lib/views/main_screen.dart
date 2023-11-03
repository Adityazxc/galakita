import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/navigations/navigation_bar.dart';
import 'package:gala_kita/views/signup.dart';
import 'package:gala_kita/views/widgets/button_global.dart';
import 'package:gala_kita/views/widgets/social_login.dart';
import 'package:gala_kita/views/widgets/text/text_form_global.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // void _signIn() async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );

  //     if (userCredential.user != null) {
  //       // Login berhasil, navigasi ke halaman beranda
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (context) => HomePage(),
  //       ));
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     // Penanganan kesalahan Firebase Authentication
  //     String errorMessage = "Login gagal";
  //     if (e.code == 'user-not-found') {
  //       errorMessage = 'User tidak ditemukan.';
  //     } else if (e.code == 'wrong-password') {
  //       errorMessage = 'Password salah.';
  //     }
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(errorMessage),
  //       ),
  //     );
  //   } catch (e) {
  //     // Login gagal, tampilkan pesan kesalahan
  //     print(e.toString());
  //   }
  // }

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
                  child: Image.asset('assets/images/logo_galakita.png'),
                ),
                const SizedBox(height: 50),
                Text(
                  'Login to your account ',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),

                //// Email Input
                TextFormGlobal(
                    controller: emailController,
                    text: 'Email',
                    error: "Alamat Website tidak boleh kosong",
                    obscure: false,
                    textInputType: TextInputType.emailAddress),

                const SizedBox(height: 10),
                //Password Input
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  error: "Alamat Website tidak boleh kosong",
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(height: 10),

                // const ButtonGlobal(),
                // ElevatedButton(
                //     onPressed: _signIn, 
                //     child: Text("Login Berhasil")),


                const SizedBox(height: 10),

                const ButtonGlobal(),
                const SizedBox(height: 25),
                SocialLogin(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Don\'t have an account?',
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SignupView();
              }));
            },
            child: Text(
              ' Sign up',
              style: TextStyle(
                color: GlobalColors.mainColor,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
