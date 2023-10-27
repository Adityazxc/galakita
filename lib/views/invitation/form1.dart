import 'package:flutter/material.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/form2.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/widgets/alert/alert_close.dart';
import 'package:gala_kita/views/widgets/text/text_form_global.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:gala_kita/views/navigations/navigation_bar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:gala_kita/models/form_data.dart';


class FormInvitation extends StatefulWidget {
  FormInvitation({super.key});

  @override
  State<FormInvitation> createState() => _FormInvitation();
}

class _FormInvitation extends State<FormInvitation> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController judulUndangan = TextEditingController();
  final TextEditingController alamatWebsite = TextEditingController();



  @override
  Widget build(BuildContext context) {
  final formData= Provider.of<FormDataUndanangan>(context,listen :false);    
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    child: Row(
                      children: [
                        const SizedBox(width: 300),
                        Container(
                          child: const Icon(
                            Icons.close,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      showAlert(context,QuickAlertType.confirm);
                    }),
                const SizedBox(height: 20),
                Text(
                  'Langkah 1 dari 5 ',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                StepProgressIndicator(
                  totalSteps: 5,
                  currentStep: 1,
                  selectedColor: GlobalColors.mainColor,
                  unselectedColor: GlobalColors.unselected,
                ),
                const SizedBox(height: 50),
                Text(
                  'Judul Undangan ',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: judulUndangan,
                  text: 'Undangan Benno Tyas',
                  error: "Judul Undangan tidak boleh kosong",
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                Text(
                  '* Judul Undangan tidak akan mempengaruhi isi ',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Alamat Website ',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: alamatWebsite,
                  text: 'benno-tyas',
                  error: "Alamat Website tidak boleh kosong",
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                Text(
                  'https://galakita.com/u/benno-tyas',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Tema ',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        backgroundColor: GlobalColors.mainColor,
        onPressed: () {
          // if (formKey.currentState!.validate()) {
            formData.updateDataUndangan(judulUndangan.text, alamatWebsite.text);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return FormInvitation5();
            }));
          // } else {}
        },
        child:const Icon(Icons.keyboard_arrow_right),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}