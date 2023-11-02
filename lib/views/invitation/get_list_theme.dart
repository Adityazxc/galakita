import 'package:flutter/material.dart';

Widget getListTheme(BuildContext context, Map<String, dynamic> data,
    Color borderColors) {
  return Row
    (
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColors, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 7,
              )
            ]),
        child: Column(
            children: [
// Image.network('${data["thumbnail"]}',width: 150, height: 150,),
              Image.asset("assets/images/theme.png"),
              const SizedBox(height: 15),
              Text("${data["name"]}"),
              Text("${data["category"]["name"]}"),

            ]
        ),
      ),
      SizedBox(width
          :
      20
      )
      ,
    ]
    ,
  );


}
