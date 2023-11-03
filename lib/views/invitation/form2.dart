import 'package:flutter/material.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/service/list_package.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/button_close.dart';
import 'package:gala_kita/views/invitation/form3.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/invitation/views_list_package.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FormInvitation2 extends StatefulWidget {
  FormInvitation2({Key? key}) : super(key: key);

  @override
  State<FormInvitation2> createState() => _FormInvitation2State();
}

class _FormInvitation2State extends State<FormInvitation2> {
  List _package = [];
  List<Color> borderColors = [];
  int? selectedPackage;
  @override
  void initState() {
    super.initState();
    _loadPackageData();
  }

  Future<void> _loadPackageData() async {
    final packageData = await allPackage();
    setState(() {
      _package = packageData;
      borderColors = List.generate(_package.length, (index) => Colors.white);
    });
  }

  void selectPackage(int index) {
    setState(() {
      borderColors = List.generate(_package.length, (i) {
        return i == index ? GlobalColors.mainColor : Colors.white;
      });
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
            ButtonClose(text: "Langkah 2 dari 5",currentStep: 2),
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
                children: _package.asMap().entries.map((entry) {
                  final index = entry.key;
                  final data = entry.value;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPackage=index;
                      selectPackage(index);
                      });
                      final idPaket = "${data['id']}";
                      final simpanPaket = Provider.of<FormDataUndanangan>(
                          context,
                          listen: false);
                      simpanPaket.updateSelectPackage(idPaket);
                      print(idPaket);
                    },
                    child: Container(
                      width: 250,
                      margin: const EdgeInsets.all(10),
                      child:
                          buildPackageItem(context, data, borderColors[index]),
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
                if(selectedPackage != null){
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: FormInvitation3()));

                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pilih Paket terlebih dahulu"),)
                  );
                }
              },
              child: const Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
