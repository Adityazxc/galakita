import 'package:flutter/material.dart';
import 'package:gala_kita/models/database/db_detail_invitation.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/button_close.dart';
import 'package:gala_kita/views/invitation/form4.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/widgets/time_form_global.dart';
import 'package:provider/provider.dart';
import 'package:gala_kita/views/widgets/text/date_form_global.dart';
import 'package:gala_kita/views/widgets/text/long_text_form_global.dart';
import 'package:gala_kita/views/widgets/text/text_form_global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/form_data.dart';

class FormInvitation3 extends StatefulWidget {
  const FormInvitation3({super.key});

  @override
  State<FormInvitation3> createState() => _FormInvitation3State();
}

class _FormInvitation3State extends State<FormInvitation3> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController mempelaiPriaController = TextEditingController();
  final TextEditingController mempelaiWanitaController =
      TextEditingController();
  final TextEditingController weddingDateController = TextEditingController();
  final TextEditingController weddingLocationController =
      TextEditingController();
  final TextEditingController loveStoryController = TextEditingController();
  final TextEditingController quoteController = TextEditingController();
  final TextEditingController eventStartTimeController =
      TextEditingController();
  final TextEditingController eventTimeEndsController = TextEditingController();
  List<Map<String, dynamic>> detailInvitation = [];



  Future<void> addItem() async {
    final mempelaiPria = mempelaiPriaController.text;
    final mempelaiWanita = mempelaiWanitaController.text;
    final weddingLocation = weddingLocationController.text;
    final loveStory = loveStoryController.text;
    final quote = quoteController.text;

    final weddingDate=weddingDateController.text;
    final eventStartTime=eventStartTimeController.text;
    final eventTimeEnds=eventTimeEndsController.text;


    if (mempelaiPria.isNotEmpty &&
        mempelaiWanita.isNotEmpty &&
        weddingLocation.isNotEmpty) {
      await DatabaseDetailInvitation.createItem(
        mempelaiPria,
        mempelaiWanita,
        weddingLocation,
        weddingDate,
        loveStory,
        quote,
        eventStartTime,
        eventTimeEnds

      );
      saveFormDataLocally(mempelaiPria, mempelaiWanita, weddingLocation, weddingDate, loveStory, quote, eventStartTime, eventTimeEnds);
      _refreshData();
    }
  }


  void saveFormDataLocally(mempelaiPria, mempelaiWanita, weddingLocation,
      weddingDate, loveStory, quote, eventStartTime, eventTimeEnds) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('savedMempelaiPria', mempelaiPria);
    prefs.setString('savedMempelaiWanita', mempelaiWanita);
    prefs.setString('savedWeddingLocation', weddingLocation);
    prefs.setString('savedWeddingDate', weddingDate);
    prefs.setString('savedLoveStory', loveStory);
    prefs.setString('savedQuote', quote);
    prefs.setString('savedEventStartTime',eventStartTime);
    prefs.setString('savedEventTimeEnds', eventTimeEnds);
  }

  @override
  void initState() {
    super.initState();
      _refreshData();
      _loadSavedFormData();
      print("heheh");
  }

  void _refreshData() async {
    final data = await DatabaseDetailInvitation.getItems();
    setState(() {
      detailInvitation = data;
    });
  }



  void _loadSavedFormData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMempelaiPria = prefs.getString('savedMempelaiPria') ?? '';
    final savedMempelaiWanita = prefs.getString('savedMempelaiWanita') ?? '';
    final savedWeddingLocation = prefs.getString('savedWeddingLocation')?? '';
    final savedWeddingDate =  prefs.getString('savedWeddingDate')?? '';
    final savedLoveStory = prefs.getString('savedLoveStory')?? '';
    final savedQuote = prefs.getString('savedQuote')?? '';
    final savedEventStartTime=  prefs.getString('savedEventStartTime')?? '';
    final savedEventTimeEnds = prefs.getString('savedEventTimeEnds')?? '';

    setState(() {
      mempelaiPriaController.text=savedMempelaiPria;
      mempelaiWanitaController.text=savedMempelaiWanita;
      weddingDateController.text=savedWeddingLocation;
        weddingLocationController.text=savedWeddingDate;
        loveStoryController.text=savedLoveStory;
        quoteController.text=savedQuote;
        eventStartTimeController.text=savedEventStartTime;
        eventTimeEndsController.text=savedEventTimeEnds;
    });
  }

  void deleteItem(int id) async {
    await DatabaseDetailInvitation.deleteItem(id);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Successfull deleted"),
      backgroundColor: Colors.green,
    ));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormDataUndanangan>(context, listen: false);

    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(
                      right: 15.0, left: 15.0, bottom: 15.0),
                  child: const ButtonClose(
                      text: "Langkah 3 dari 5", currentStep: 3)),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          Container(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0, bottom: 15.0),
                              child: Form(
                                  key: formKey,
                                  child: SafeArea(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                controller:
                                                    eventStartTimeController,
                                                textInputType:
                                                    TextInputType.text,
                                                obscure: false),
                                            //untuk memisahkan objek yang berdempetan
                                            Expanded(child: Container()),
                                            TimeFormGlobal(
                                                controller:
                                                    eventTimeEndsController,
                                                text: "jam Akhir",
                                                textInputType:
                                                    TextInputType.text,
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
                                          error:
                                              "Cerita Cinta tidak boleh kosong",
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
              Expanded(
                child: ListView.builder(
                  itemCount: detailInvitation.length,
                  itemBuilder: (context, index) => Card(
                    color: index % 2 == 0 ? Colors.green : Colors.green[200],
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                      title: Text(detailInvitation[index]['mempelaiPria']),
                      subtitle: Row(
                        children: [
                          Text(detailInvitation[index]['mempelaiWanita']),
                          const SizedBox(width: 10),
                          Text(detailInvitation[index]['weddingLocation']
                              .toString())
                          // Text(detailInvitation[index]['themeId'].toString()), // Jika 'themeId' adalah tipe data yang bukan String
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  deleteItem(detailInvitation[index]['id']),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  deleteItem(detailInvitation[index]['id']),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              FloatingActionButton(
                heroTag: "btnNextP",
                backgroundColor: GlobalColors.mainColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.keyboard_arrow_left),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                backgroundColor: GlobalColors.mainColor,
                onPressed: () async {
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
                  await addItem();
                  if (!context.mounted) return;
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FormInvitation5();
                  }));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Pastikan form tidak kosong")));
                  }
                },
                child: const Icon(Icons.keyboard_arrow_right),
              ),
            ])));
  }
}
