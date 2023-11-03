import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/utils/invitation_componen.dart';

import 'package:flutter/material.dart';
import 'package:gala_kita/views/invitation/preview/preview_content.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../Utils/global.colors.dart';

class PreviewInvitation extends StatefulWidget {
  const PreviewInvitation({super.key});

  @override
  State<PreviewInvitation> createState() => _PreviewInvitationState();
}

class _PreviewInvitationState extends State<PreviewInvitation> {
  bool showAmplopKita = true;
  bool showQuote = true;
  final ScrollController _scrollController = ScrollController();
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void toggleAmplopKita() {
    setState(() {
      showAmplopKita = !showAmplopKita;
    });
  }

  void toggleQuote() {
    setState(() {
      showQuote = !showQuote;
    });
  }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isButtonVisible) {
        setState(() {
          _isButtonVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isButtonVisible) {
        setState(() {
          _isButtonVisible = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formData=Provider.of<FormDataUndanangan>(context, listen:false);
    final namaPria=formData.mempelaiPria;
    final namaWanita=formData.mempelaiWanita;
    final weddingLocation=formData.weddingLocation;
    final startTime=formData.eventStartTime;
    final weddingDate=formData.weddingDate;


    return Scaffold(
      body: Container(
        color: ColorsInvitation.mainColor,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(
                height: 120,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset("assets/images/vector1.png"),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset("assets/images/vector2.png"),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset("assets/images/vector3.png"),
                    ),
                  ],
                ),
              ),
              Container(
                // Ganti dengan warna yang sesuai
                padding: const EdgeInsets.all(20.0),
                // Tambahkan padding ke kontainer utama
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Mempelai Pria
                    MainText(context, "The Wedding Of", 30, 30),
                    //Mempelai Pria
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          "assets/images/man.png",
                          width: 152,
                          height: 230,
                        ),
                        Image.asset(
                          "assets/images/frame_profil.png",
                          width: 179,
                          height: 270,
                        ),
                      ],
                    ),

                    SizedBox(height: 18),
                    MainText(context, namaPria, 26, 23),
                    MainText(context, "&", 45, 10),
                    //Mempelai Wanita
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Image.asset(
                          "assets/images/man.png",
                          width: 152,
                          height: 230,
                        ),
                        Image.asset(
                          "assets/images/frame_profil.png",
                          width: 179,
                          height: 270,
                        ),
                      ],
                    ),

                    SizedBox(height: 18),
                    MainText(context, namaWanita, 26, 17),
                    Container(
                      padding: EdgeInsets.only(top: 24),
                      decoration: ShapeDecoration(
                        color: Color(0xFFFCF2DD),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 3, color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x21000000),
                            blurRadius: 36,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          MainText(context, "Akad", 18, 14),
                          SecondaryText(
                              context, weddingDate, 12, 14),
                          SecondaryText(context, "Pukul $startTime WIB", 12, 14),
                          SecondaryText(
                              context,
                              weddingLocation,
                              12,
                              14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SecondaryText(context, "12", 24, 0),
                                  SecondaryText(context, "Days", 12, 0),
                                ],
                              ),
                              SizedBox(width: 24),
                              Column(
                                children: [
                                  SecondaryText(context, "24", 24, 0),
                                  SecondaryText(context, "Hours", 12, 0),
                                ],
                              ),
                              SizedBox(width: 24),
                              Column(
                                children: [
                                  SecondaryText(context, "32", 24, 0),
                                  SecondaryText(context, "Minutes", 12, 0),
                                ],
                              ),
                              SizedBox(width: 24),
                              Column(
                                children: [
                                  SecondaryText(context, "44", 24, 0),
                                  SecondaryText(context, "Second", 12, 0),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 36),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 34, vertical: 8),
                            decoration: ShapeDecoration(
                              color: Color(0xFF624A59),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Lihat Lokasi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                         const SizedBox(height: 24),
                          Image.asset("assets/images/vector5.png"),
                          //Resepsi
                         const SizedBox(height: 24),
                          MainText(context, "Resepsi", 18, 14),
                          SecondaryText(
                              context, weddingDate, 12, 14),
                          SecondaryText(context, "Pukul $startTime WIB", 12, 14),
                          SecondaryText(
                              context,
                              weddingLocation,
                              12,
                              14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SecondaryText(context, "12", 24, 0),
                                  SecondaryText(context, "Days", 12, 0),
                                ],
                              ),
                              SizedBox(width: 24),
                              Column(
                                children: [
                                  SecondaryText(context, "24", 24, 0),
                                  SecondaryText(context, "Hours", 12, 0),
                                ],
                              ),
                              SizedBox(width: 24),
                              Column(
                                children: [
                                  SecondaryText(context, "32", 24, 0),
                                  SecondaryText(context, "Minutes", 12, 0),
                                ],
                              ),
                              SizedBox(width: 24),
                              Column(
                                children: [
                                  SecondaryText(context, "44", 24, 0),
                                  SecondaryText(context, "Second", 12, 0),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 36),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 34, vertical: 8),
                            decoration: ShapeDecoration(
                              color: Color(0xFF624A59),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Lihat Lokasi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                    const SizedBox(height: 52),
                    if (showQuote) Quote(),
                    const SizedBox(height: 52),
                    if (showAmplopKita) AmplopKita(),
                  ],
                ),
              ),
              const SizedBox(height: 52),
              //Thanks
              Stack(
                alignment: Alignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(43, 39, 39, 0.8),
                      BlendMode.modulate, // Blend mode yang sesuai
                    ),
                    child: Image.asset("assets/images/bg_bride.png"),
                  ),
                  Column(
                    children: [
                      const Text(
                        "Terima Kasih",
                        style: TextStyle(
                          fontFamily: "Satisfy",
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 56),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/bride.png",
                          width: 320,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        width: 320,
                        child: Text(
                          "Terimakasih kepada semuanya yang telah hadir dalam pernikahan kami, kami sangat bersyukur kalian bisa datang",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Benno & Tyas",
                        style: TextStyle(
                          fontFamily: "Satisfy",
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                  // Image.asset("assets/images/bride.png"),
                ],
              ),

              Container(
                  padding: EdgeInsets.only(top: 32, bottom: 70),
                  child: Image.asset(
                    "assets/images/logo_galakita.png",
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: _isButtonVisible ? 1 : 0,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: ShapeDecoration(
            color: Color.fromRGBO(43, 39, 39, 0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                onPressed: toggleAmplopKita,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.email),
                    Text(showAmplopKita ? 'Hide' : "Show")
                  ],
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                onPressed: toggleQuote,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.format_quote),
                    Text(showQuote ? 'Hide' : "Show")
                  ],
                ),
              ),FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back),
                    Text("back")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
