import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal(
      {super.key,
        required this.controller,
        required this.text,
        required this.error,
        required this.textInputType,
        required this.obscure,
      });
  final TextEditingController controller;
  final String text, error;
  final TextInputType textInputType;
  final bool obscure;


  @override
  Widget build(BuildContext context) {
      String titleError="";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          padding: const EdgeInsets.only(top: 3, left: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 7,
                )
              ]),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                titleError=error;
                return titleError;
              }else{
                titleError='';
              }
              return null;
            },
            controller: controller,
            keyboardType: TextInputType.multiline,
            obscureText: obscure,

            decoration: InputDecoration(
                hintText: text,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0),
                hintStyle: const TextStyle(
                  height: 1,
                )),
          ),
        ),
        if (titleError.isNotEmpty) // Gantilah showError dengan kondisi yang sesuai
          Text(
            titleError,
            style: TextStyle(
              color: Colors.red, // Atur warna dan gaya pesan kesalahan sesuai kebutuhan Anda
            ),
          )
      ],
    );
  }
}