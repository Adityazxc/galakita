import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeFormGlobal extends StatefulWidget {
  const TimeFormGlobal({
    super.key,
    required this.text,
    required this.textInputType,
    required this.obscure,
  });
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  State<TimeFormGlobal> createState() => _TimeFormGlobalState();
}

class _TimeFormGlobalState extends State<TimeFormGlobal> {
  TimeOfDay time = TimeOfDay(hour: 8, minute: 30);
  TextEditingController timeinput = TextEditingController();

  @override
  void initState() {
    timeinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 150,
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
              return "Jam harus diisi";
            }
            return null;
          },
          controller: timeinput,
          keyboardType: widget.textInputType,
          obscureText: widget.obscure,
          decoration: InputDecoration(
              icon: Icon(Icons.watch_later_outlined),
              hintText: widget.text,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(0),
              hintStyle: const TextStyle(
                height: 1,
              )),
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());
            if (pickedTime != null) {
              print(pickedTime.format(context));
              DateTime parsedTime = DateFormat('h:mm a').parse(pickedTime.format(context));


              print(parsedTime);
              String formattedTime = DateFormat('HH:mm').format(parsedTime);
              print(formattedTime);

              setState(() {
                timeinput.text = formattedTime;
              });
            } else {
              print("Time is not selected");
            }
          }),
    );
  }
}