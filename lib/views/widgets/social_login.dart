import 'package:flutter/material.dart';
import 'package:gala_kita/utils/global.colors.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            '-Or Sign Up With-',
            style: TextStyle(
              color: GlobalColors.mainColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}