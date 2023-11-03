import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormGlobal extends StatefulWidget {
  const DateFormGlobal(
      {super.key,
      required this.text,
      required this.textInputType,
      required this.obscure,
      required this.controller});
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final TextEditingController controller;

  @override
  State<DateFormGlobal> createState() => _DateFormGlobalState();
}

class _DateFormGlobalState extends State<DateFormGlobal> {
  @override
  void initState() {
    widget.controller.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String error="";
    return Column(
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
                  error="Tanggal tidak boleh kosong";
                  return error ;
                }else{
                  error="";
                }
                return null;
              },
              controller: widget.controller,
              keyboardType: widget.textInputType,
              obscureText: widget.obscure,
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  hintText: widget.text,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(0),
                  hintStyle: const TextStyle(
                    height: 1,
                  )
              ),

              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050));
                if (pickedDate != null) {
                  String formatDate = DateFormat('dd MMMM yyyy').format(pickedDate);
                  setState(() {
                    widget.controller.text = formatDate;
                  });
                } else {
                  print("Date Tidak Dipilih");
                  widget.controller.text = "";
                }
              }),
        ),
        if (error.isNotEmpty) // Gantilah showError dengan kondisi yang sesuai
          Text(
            error,
            style: TextStyle(
              color: Colors.red, // Atur warna dan gaya pesan kesalahan sesuai kebutuhan Anda
            ),
          )
      ],
    );
  }
}