import 'package:flutter/material.dart';
import 'package:gala_kita/utils/global.colors.dart';

class TextHeaderPackage extends StatelessWidget {
  const TextHeaderPackage({
    super.key,
    required this.titleText,
    required this.planText,
    required this.taglineText,
  });

  final String  planText, taglineText,titleText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            titleText,
            style: TextStyle(
                color: GlobalColors.maintext,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Text(
            planText,
            style: TextStyle(
                color: GlobalColors.maintext,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(
            taglineText,
            style: TextStyle(
                color: GlobalColors.unselected,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}