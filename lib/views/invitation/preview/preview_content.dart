import 'package:flutter/material.dart';

import '../../../utils/invitation_componen.dart';

class AmplopKita extends StatelessWidget {
  const AmplopKita({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 24, bottom: 24),
      decoration: ShapeDecoration(
        color: const Color(0xFFFCF2DD),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x21000000),
            blurRadius: 36,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          MainText(context, "Amplop Kita", 18, 13),
          SecondaryText(
              context,
              "Doa restu anda merupakan karunia yang sangat berarti bagi kami dan jika memberi adalah ungkapan tanda terimakasij amnda, maka anda dapat memberi kado sevara cashless ",
              12,
              18),
          Image.asset("assets/images/qr.png"),
        ],
      ),
    );
  }
}

class Quote extends StatelessWidget {
  const Quote({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainText(context, "Quotes", 36, 39),
        Container(
          padding: EdgeInsets.only(
              right: 20, left: 20, top: 24, bottom: 24),
          decoration: ShapeDecoration(
            color: Color(0xFFFCF2DD),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x21000000),
                blurRadius: 36,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              MainText(context, "Nikah Muda", 18, 13),
              SecondaryText(
                  context,
                  "\"Pernikahan adalah ibadah, dan setiap ibadah bermuara pada cinta-Nya sebagai tujuan. Sudah sewajarnya setiap upaya meraih cinta-Nya dilakukan dengan sukacita.\" ",
                  12,
                  13),
            ],
          ),
        ),
      ],
    );
  }
}
