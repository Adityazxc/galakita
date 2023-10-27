import 'package:gala_kita/utils/global.colors.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter/material.dart';
import '../../navigations/navigation_bar.dart';



void showAlert(BuildContext context,QuickAlertType quickAlertType) {
    QuickAlert.show(
        context: context,
        type: quickAlertType,
        title: 'Apakah anda yakin ingin menutup form?',
        confirmBtnText: 'Yakin',
        cancelBtnText: 'Tidak',
        confirmBtnColor: GlobalColors.mainColor,
        onConfirmBtnTap: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Home();
            })));
  }

 