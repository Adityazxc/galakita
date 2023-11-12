import 'package:flutter/material.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/button_close.dart';
import 'package:gala_kita/views/invitation/form4.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/widgets/time_form_global.dart';
import 'package:provider/provider.dart';
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
  final TextEditingController mempelaiPriaController = TextEditingController();
  final TextEditingController mempelaiWanitaController = TextEditingController();
  final TextEditingController weddingDateController = TextEditingController();
  final TextEditingController weddingLocationController = TextEditingController();
  final TextEditingController loveStoryController = TextEditingController();
  final TextEditingController quoteController = TextEditingController();
  final TextEditingController eventStartTimeController = TextEditingController();
  final TextEditingController eventTimeEndsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormDataUndanangan>(context, listen: false);

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(right: 15.0,left: 15.0,bottom: 15.0),
                  child: const ButtonClose(text: "Langkah 3 dari 5", currentStep: 3)),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[

                    SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          Container(
                              padding: const EdgeInsets.only(right: 15.0,left: 15.0,bottom: 15.0),
                              child: Form(
                                  key: formKey,
                                  child: SafeArea(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nama Mempelai Pria ',
                                          style: TextStyle(
                                              color: GlobalColors.textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 15),
                                        TextFormGlobal(
                                          controller: mempelaiPriaController,
                                          text: 'Benno',
                                          error:
                                          "Nama Mempelai Pria tidak boleh kosong",
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
                                          controller: mempelaiWanitaController,
                                          error:
                                          "Nama Mempelai Wanita tidak boleh kosong",
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
                                          controller: weddingDateController,
                                          text: 'Masukkan tanggal acara',
                                          obscure: false,
                                          textInputType: TextInputType.text,
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                        const SizedBox(height: 15),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            TimeFormGlobal(
                                                text: "jam awal",
                                                controller: eventStartTimeController,
                                                textInputType: TextInputType.text,
                                                obscure: false),
                                            //untuk memisahkan objek yang berdempetan
                                            Expanded(child: Container()),
                                            TimeFormGlobal(
                                                controller: eventTimeEndsController,
                                                text: "jam Akhir",
                                                textInputType: TextInputType.text,
                                                obscure: false),
                                          ],
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
                                          controller: weddingLocationController,
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
                                          controller: loveStoryController,
                                          maxCharacter: 250,
                                          text: 'blablabla',
                                          error: "Cerita Cinta tidak boleh kosong",
                                          obscure: false,
                                          textInputType: TextInputType.text,
                                        ),
                                        const SizedBox(height: 15),
                                        const SizedBox(height: 15),
                                        LongTextFormGlobal(
                                          controller: quoteController,
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
                                          controller: quoteController,
                                          text: 'quote',
                                          error: "Quote tidak boleh kosong",
                                          obscure: false,
                                          textInputType: TextInputType.text,
                                        ),
                                        const SizedBox(height: 70),
                                      ],
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              FloatingActionButton(
                backgroundColor: GlobalColors.mainColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.keyboard_arrow_left),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                backgroundColor: GlobalColors.mainColor,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formData.updateDetailInvitation(
                      mempelaiPriaController.text,
                      mempelaiWanitaController.text,
                      weddingLocationController.text,
                      weddingDateController.text,
                      loveStoryController.text,
                      quoteController.text,
                      eventStartTimeController.text,
                      eventTimeEndsController.text,
                    );
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const FormInvitation5();
                    }));
                  } else {}
                },
                child: const Icon(Icons.keyboard_arrow_right),
              ),
            ])));
  }
}