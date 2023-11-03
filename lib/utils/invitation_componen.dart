import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorsInvitation {
  ///main color CB8461

  static HexColor mainColor = HexColor('#FCF2DD');
  static HexColor textColor = HexColor('#6D465F');
  static HexColor danger = HexColor('#DC2833');
  static HexColor unselected = HexColor('#667085');
  static HexColor unselectedBar = HexColor('#49516F');
  static HexColor maintext = HexColor('#101828');
  static HexColor checklist = HexColor('#12B76A');
}



Widget MainText(BuildContext context, String text,double fontSize,double height) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(
          fontFamily: "Satisfy",
          color: ColorsInvitation.textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: height)
    ],
  );
}
Widget SecondaryText(BuildContext context, String text,double fontSize,double height) {
  return Column(
    children: [
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Poppins",
          color: ColorsInvitation.textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: height)
    ],
  );
}
