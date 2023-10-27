import 'package:flutter/material.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/form4.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../navigations/home_page.dart';
import '../navigations/navigation_bar.dart';

class FormInvitation5 extends StatelessWidget {
  // String tanggalPernikahan;
  final formKey = GlobalKey<FormState>();
  FormInvitation5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get data dari Provider(tempat menyimpan data form)
    final formData = Provider.of<FormDataUndanangan>(context, listen: false);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        child: Container(
                          child: Icon(
                            Icons.close,
                            size: 50,
                            color: GlobalColors.unselected,
                          ),
                        ),
                        onTap: () async {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                        }),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Langkah 5 dari 5 ',
                          style: TextStyle(
                              color: GlobalColors.textColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    StepProgressIndicator(
                      totalSteps: 5,
                      currentStep: 5,
                      selectedColor: GlobalColors.mainColor,
                      unselectedColor: GlobalColors.unselected,
                    ),
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pembayaran ',
                        style: TextStyle(
                            color: GlobalColors.maintext,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/theme.png'),
                                      const SizedBox(height: 15),
                                      Container(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Pernikahan Tyas",
                                                style: TextStyle(
                                                    color:
                                                        GlobalColors.maintext,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                width: 200,
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.location_on),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      "Jl, Dipatiukur no 10",
                                                      style: TextStyle(
                                                          color: GlobalColors
                                                              .unselected,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                width: 200,
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.calendar_month),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      "16 Februari, 2023",
                                                      style: TextStyle(
                                                          color: GlobalColors
                                                              .unselected,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                width: 200,
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Row(
                                                  children: [
                                                    const Icon(Icons.timelapse),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      "08:00 - 16:00",
                                                      style: TextStyle(
                                                          color: GlobalColors
                                                              .unselected,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          )),
                                      const SizedBox(height: 20),
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(
                                                color: GlobalColors.mainColor,
                                                width: 1)),
                                        label: Text(
                                          'Preview',
                                          style: TextStyle(
                                              color: GlobalColors.mainColor),
                                        ),
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: GlobalColors.mainColor,
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: const Divider(
                          color: Colors.black,
                          height: 10,
                          thickness: 2,
                        ),
                      ),
                      Text(
                        'Paket',
                        style: TextStyle(
                            fontSize: 18,
                            color: GlobalColors.mainColor,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Paket Basic',
                            style: TextStyle(
                                fontSize: 18,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(child: Container()),
                          Text(
                            'Rp 50.000',
                            style: TextStyle(
                                fontSize: 18,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 23,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.w600),
                          ),
                          Expanded(child: Container()),
                          Text(
                            formData.judul,
                            style: TextStyle(
                                fontSize: 23,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                    ]))),
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
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return FormInvitation4();
                    }));
                  } else {}
                },
                child: Icon(Icons.keyboard_arrow_right),
              ),
            ])));
  }
}
