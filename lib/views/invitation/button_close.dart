import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Utils/global.colors.dart';
import '../widgets/alert/alert_close.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({super.key, required this.text, required this.currentStep});

  final String text;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: SizedBox()),
              InkWell(
                  child: Container(
                    child: Icon(
                      Icons.close,
                      size: 50,
                      color: GlobalColors.unselected,
                    ),
                  ),
                  onTap: () async {
                    showAlert(context, QuickAlertType.confirm);
                  }),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          StepProgressIndicator(
            totalSteps: 5,
            currentStep: currentStep,
            selectedColor: GlobalColors.mainColor,
            unselectedColor: GlobalColors.unselected,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
