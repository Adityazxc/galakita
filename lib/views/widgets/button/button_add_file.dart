import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class buttonAddFile extends StatelessWidget {
  const buttonAddFile({
    super.key,
    required this.caption,
  });

  final String caption;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        decoration: const BoxDecoration(
            border: DashedBorder.fromBorderSide(
                side: BorderSide(), dashLength: 10)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Center(child: Icon(Icons.cloud_upload_outlined)),
            ),
            Container(
              child: Center(
                child: Text(
                  caption,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ));
  }
}