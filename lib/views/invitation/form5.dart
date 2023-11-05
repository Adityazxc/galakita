import 'package:flutter/material.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/service/list_theme.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/form4.dart';
import 'package:gala_kita/views/invitation/preview/preview.dart';
import 'package:gala_kita/views/invitation/views_list_package.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../service/list_package.dart';
import '../navigations/navigation_bar.dart';
import 'button_close.dart';

class FormInvitation5 extends StatefulWidget {
  FormInvitation5({Key? key}) : super(key: key);

  @override
  State<FormInvitation5> createState() => _FormInvitation5State();
}

class _FormInvitation5State extends State<FormInvitation5> {
  // String tanggalPernikahan;
  List _package = [];
  List _theme = [];
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadPackageData();
    loadThemeData();
  }

  Future<void> _loadPackageData() async {
    final packageData = await allPackage();
    setState(() {
      _package = packageData;
    });
  }

  Future<void> loadThemeData() async {
    final themeData = await allTheme();
    setState(() {
      _theme = themeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // get data dari Provider(tempat menyimpan data form)
    final formData = Provider.of<FormDataUndanangan>(context, listen: false);
    final idPackage = formData.idPackage;
    final package = _package[int.parse(idPackage) - 1];
    final price = package['price'];

    final idTheme = formData.idTheme;
    final theme = _theme[int.parse(idTheme) - 1];

    var topping = 100000;
    final totalPrice = topping + price;
    final image=formData.Image;

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ButtonClose(text: "Langkah 5 dari 5", currentStep: 5),
                      Text(
                        "Pembayaran",
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
                                      Center(
                                        widthFactor: 0.5,
                                        child: Text(theme['name']),
                                      ),
                                      const SizedBox(height: 15),
                                      
                                      
                                      // menampilkan image
                                      image != null
                                      ? Image.file(
                                        image!
                                      ):Image.asset('assets/images/theme.png'),
                                      const SizedBox(height: 15),
                                      Container(
                                          padding:
                                          const EdgeInsets.only(left: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                formData.titleInvitation,
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
                                                      formData.weddingLocation,
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
                                                      formData.weddingDate,
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
                                                      "${formData.eventStartTime} - ${formData.eventTimeEnds}",
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
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.bottomToTop,
                                                  child: PreviewInvitation()));
                                        },
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
                        "Rincian",
                        style: TextStyle(
                            fontSize: 16,
                            color: GlobalColors.maintext,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            package['name'],
                            style: TextStyle(
                                fontSize: 16,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            formatCurrency(price),
                            style: TextStyle(
                                fontSize: 16,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Topping
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Toping",
                            style: TextStyle(
                                fontSize: 16,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            formatCurrency(topping),
                            style: TextStyle(
                                fontSize: 16,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Total Bayar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 24,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            formatCurrency(totalPrice),
                            style: TextStyle(
                                fontSize: 24,
                                color: GlobalColors.maintext,
                                fontWeight: FontWeight.bold),
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                },
                child: Icon(Icons.keyboard_arrow_right),
              ),
            ])));
  }
}