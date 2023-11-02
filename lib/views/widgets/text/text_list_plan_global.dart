import 'package:flutter/material.dart';
import '../../../utils/global.colors.dart';

class TextListPlanGlobal extends StatelessWidget {
  const TextListPlanGlobal({
    super.key,
    required this.textList,
  });

  final String textList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_sharp,
            color: GlobalColors.checklist,
          ),
          const SizedBox(width: 10),
          Text(
            textList,
            style: TextStyle(
                color: GlobalColors.unselected,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}