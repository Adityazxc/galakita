import 'package:flutter/material.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/service/list_package.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/form3.dart';
import 'package:gala_kita/views/invitation/views_list_package.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:gala_kita/views/widgets/alert/alert_close.dart';


class FormInvitation2 extends StatefulWidget {
  FormInvitation2({Key? key}) : super(key: key);

  @override
  State<FormInvitation2> createState() => _FormInvitation2State();
}

class _FormInvitation2State extends State<FormInvitation2> {
  List _package = [];

  @override
  void initState() {
    super.initState();
    _loadPackageData();
  }

  Future<void> _loadPackageData() async {
    final packageData = await allPackage();
    setState(() {
      _package = packageData;
    });
  }

  int selectedPlan = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Text(
              'Langkah 2 dari 5 ',
              style: TextStyle(
                  color: GlobalColors.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            StepProgressIndicator(
              totalSteps: 5,
              currentStep: 2,
              selectedColor: GlobalColors.mainColor,
              unselectedColor: GlobalColors.unselected,
            ),
            const SizedBox(height: 50),
            Center(
                child: Text(
              'Pilih Paket ',
              style: TextStyle(
                  color: GlobalColors.maintext,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )),
            const SizedBox(height: 10),
            Center(
                child: Text(
              'Pilih Paket Untuk undangan mu! ',
              style: TextStyle(
                  color: GlobalColors.unselected,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
            const SizedBox(height: 20),
            Container(
              child: Row(children: [
                Icon(Icons.warning_amber, color: Colors.yellow),
                SizedBox(width: 10),
                Text(
                  'Paket Masih bisa di upgrade setelah pembayaran ',
                  style: TextStyle(
                      color: GlobalColors.unselected,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _package.map((data) {
                  return GestureDetector(
                    onTap: (){
                      final idPaket="${data['id']}";
                      final simpanPaket=Provider.of<FormDataUndanangan>(context, listen:false);
                      simpanPaket.updatePilihPaket(idPaket);
                      print(idPaket);
                    },
                    child: Container(
                      width: 250,
                      margin: const EdgeInsets.all(10),
                      child: buildPackageItem(data),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: GlobalColors.mainColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.keyboard_arrow_left),
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: GlobalColors.mainColor,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FormInvitation3();
                }));
              },
              child: const Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
