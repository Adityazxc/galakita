import 'package:flutter/material.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/form4.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/widgets/alert/alert_close.dart';
import 'package:gala_kita/views/widgets/time_form_global.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:gala_kita/views/widgets/text/date_form_global.dart';
import 'package:gala_kita/views/widgets/text/long_text_form_global.dart';
import 'package:gala_kita/views/widgets/text/text_form_global.dart';
import '../../models/form_data.dart';

class FormInvitation3 extends StatefulWidget {
  const FormInvitation3({super.key});

  @override
  State<FormInvitation3> createState() => _FormInvitation3State();
}

class _FormInvitation3State extends State<FormInvitation3> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController mempelaiPria = TextEditingController();
  final TextEditingController mempelaiWanita = TextEditingController();
  final TextEditingController tanggalPernikahan = TextEditingController();
  final TextEditingController lokasi = TextEditingController();
  final TextEditingController ceritaCinta = TextEditingController();
  final TextEditingController quote = TextEditingController();
  final TextEditingController jamAwal = TextEditingController();
  final TextEditingController jamAkhir = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormDataUndanangan>(context, listen: false);

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                            showAlert(context, QuickAlertType.confirm);
                          }),
                      const SizedBox(height: 20),
                      Text(
                        'Langkah 3 dari 5',
                        style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      StepProgressIndicator(
                        totalSteps: 5,
                        currentStep: 3,
                        selectedColor: GlobalColors.mainColor,
                        unselectedColor: GlobalColors.unselected,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'Data Mempelai ',
                        style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.warning,
                              color: Colors.amber[400],
                            ),
                            Text(
                              'Semua data bisa diedit setelah pembayaran',
                              style: TextStyle(
                                  color: GlobalColors.textColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Nama Mempelai Pria ',
                        style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      TextFormGlobal(
                        controller: mempelaiPria,
                        text: 'Benno',
                        error: "Nama Mempelai Pria tidak boleh kosong",
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Nama Mempelai Wanita ',
                        style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      TextFormGlobal(
                        controller: mempelaiWanita,
                        error: "Nama Mempelai Wanita tidak boleh kosong",
                        text: 'Tyas',
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Tanggal Pernikahan ',
                        style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      DateFormGlobal(
                        controller: tanggalPernikahan,
                        text: 'Masukkan tanggal acara',
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Jam Mulai ',
                              style: TextStyle(
                                  color: GlobalColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 130),
                            Text(
                              'Jam Selesai ',
                              style: TextStyle(
                                  color: GlobalColors.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TimeFormGlobal(
                                text: "jam awal",
                                controller: jamAwal,
                                textInputType: TextInputType.text,
                                obscure: false),
                            //untuk memisahkan objek yang berdempetan
                            Expanded(child: Container()),
                            TimeFormGlobal(
                                controller: jamAkhir,
                                text: "jam Akhir",
                                textInputType: TextInputType.text,
                                obscure: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Lokasi Pernikahan ',
                        style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      TextFormGlobal(
                        controller: lokasi,
                        text: 'benno-tyas',
                        error: "Lokasi tidak boleh kosong",
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Cerita Cinta ',
                        style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      LongTextFormGlobal(
                        controller: ceritaCinta,
                        maxCharacter: 250,
                        text: 'blablabla',
                        error: "Cerita Cinta tidak boleh kosong",
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      const SizedBox(height: 15),
                      LongTextFormGlobal(
                        controller: quote,
                        text: 'quote',
                        error: "Quote tidak boleh kosong",
                        maxCharacter: 150,
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Quote ',
                        style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      TextFormGlobal(
                        controller: quote,
                        text: 'quote',
                        error: "Quote tidak boleh kosong",
                        obscure: false,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 70),
                    ],
                  ))),
        ),
        floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              FloatingActionButton(
                backgroundColor: GlobalColors.mainColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.keyboard_arrow_left),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                backgroundColor: GlobalColors.mainColor,
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  formData.updateDetailUndangan(
                    mempelaiPria.text,
                    mempelaiWanita.text,
                    lokasi.text,
                    tanggalPernikahan.text,
                    ceritaCinta.text,
                    quote.text,
                    jamAwal.text,
                    jamAkhir.text,
                  );
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FormInvitation5();
                  }));
                  // } else {}
                },
                child: Icon(Icons.keyboard_arrow_right),
              ),
            ])));
  }
}
