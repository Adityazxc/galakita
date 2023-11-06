import 'package:flutter/material.dart';
import 'package:gala_kita/models/db_invitation.dart';
import 'package:gala_kita/models/invitation.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/button_close.dart';
import 'package:gala_kita/views/invitation/form2.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/invitation/get_list_theme.dart';
import 'package:gala_kita/views/widgets/text/text_form_global.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:sqflite/sqflite.dart';
import '../../service/list_theme.dart';

class FormInvitation extends StatefulWidget {
  FormInvitation({super.key});

  @override
  State<FormInvitation> createState() => _FormInvitation();
}

class _FormInvitation extends State<FormInvitation> {
  List theme = [];
  List<Color> borderColors = [];
  int? categoryTheme = 1;
  int? selectedThemeIndex;
  String previewUrlInvitation = '';
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleInvitationController = TextEditingController();
  final TextEditingController urlWebInvitationController = TextEditingController();

  int id =0;
  String title="";
  String url="";
  String theme_id="";
  List<InvitationModel> Invitation=[];


  @override
  void initState() {
    super.initState();
    loadThemeData(categoryTheme);
    urlWebInvitationController.addListener(() {
      setState(() {
        previewUrlInvitation = urlWebInvitationController.text;
      });
    });

    //mengambil data di database
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      Invitation = await DbInvitation.instance.getInvitations();
      setState(() {

      });
    });
  }

  Future<void> loadThemeData(categoryTheme) async {
    final themeData = await allTheme();
    final filteredTheme = <Map<String, dynamic>>[];
    final categories = Set<int>(); //agar data tidak double

    themeData.forEach((theme) {
      final categoryId = theme['categoryId'];
      if (!categories.contains(categoryId)) {
        // Menambahkan kategori unik ke daftar kategori
        categories.add(categoryId);
      }
      if (categoryId == categoryTheme) {
        //mengganti '1' dengan ID kategori yang ingin di
        filteredTheme.add(theme);
      }
    });

    setState(() {
      theme = filteredTheme;
      borderColors = List.generate(theme.length, (index) => Colors.white);
    });
    print("Daftar Kategori:");
    categories.forEach((categoryId) {
      print("Category ID: $categoryId");
    });
  }

  void selectTheme(int index) {
    setState(() {
      borderColors = List.generate(theme.length, (i) {
        return i == index ? GlobalColors.mainColor : Colors.white;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<FormDataUndanangan>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ButtonClose(text: "Langkah 1 dari 5", currentStep: 1),
                Text(
                  'Judul Undangan ',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: titleInvitationController,
                  text: 'Undangan Benno Tyas',
                  error: "Judul Undangan tidak boleh kosong",
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                // TextFormField(
                //   controller: titleInvitationController,
                //   decoration: const InputDecoration(hintText: "title"),
                //   validator: (value) => _onValidateText(value),
                //   keyboardType: TextInputType.text,
                //   onSaved: (value) => title= value.toString(),
                // ),
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
                  controller: urlWebInvitationController,
                  text: 'benno-tyas',
                  error: "Alamat Website tidak boleh kosong",
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 5),
                Text(
                  'https://galakita.com/u/$previewUrlInvitation',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tema ',
                      style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 150,
                      child: DropdownButtonFormField(
                        items: const <DropdownMenuItem<int>>[
                          DropdownMenuItem<int>(
                              value: 1, child: Text("Minimalist")),
                          DropdownMenuItem<int>(value: 2, child: Text("Dark")),
                          DropdownMenuItem<int>(value: 3, child: Text("all")),
                        ],
                        onChanged: (int? newValue) {
                          setState(() {
                            categoryTheme = newValue;
                          });
                          // Mengambil ID tema yang sesuai dengan kategori yang dipilih
                          final selectedTheme = theme.firstWhere(
                              (theme) => theme['categoryID'] == categoryTheme);
                          final idTheme = selectedTheme['id'].toString();

                          final saveTheme = Provider.of<FormDataUndanangan>(
                              context,
                              listen: false);
                          saveTheme.updateSelectPackage(idTheme);
                          print("ini kategori theme $newValue");
                          loadThemeData(categoryTheme);
                        },
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: theme.asMap().entries.map((entry) {
                      final index = entry.key;
                      final data = entry.value;
                      // print("${data["name"]}");
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedThemeIndex = index;
                            selectTheme(index);
                          });
                          final idTheme = "${data['id']}";
                          final saveTheme = Provider.of<FormDataUndanangan>(
                              context,
                              listen: false);
                          saveTheme.updateSelectTheme(idTheme);
                          print("ini id theme $idTheme");
                        },
                        child: getListTheme(context, data, borderColors[index]),
                      );
                    }).toList(),
                  ),
                ),

              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        backgroundColor: GlobalColors.mainColor,
        onPressed: () {
          if (formKey.currentState != null &&
              formKey.currentState!.validate() &&
              selectedThemeIndex != null) {
            formData.updateDataInvitation(
                titleInvitationController.text, urlWebInvitationController.text);
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: FormInvitation2()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Pilih tema telebih dahulu")));
          }
        },
        child: const Icon(Icons.keyboard_arrow_right),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  String? _onValidateText(String? value){
    if(value?.isEmpty ?? true)return 'tidak boleh kosong';
    return null;
  }

  _onSaveInvitation()async{
    FocusScope.of(context).requestFocus(FocusNode());

    if(formKey.currentState?.validate()??false){
      formKey.currentState?.save();
      urlWebInvitationController.text='';
      titleInvitationController.text='';

      await DbInvitation.instance.insertInvitation(InvitationModel(
          id: id,
          title: title,
          url: url,
          themeId: theme_id,
      ));
      Invitation=await DbInvitation.instance.getInvitations();
      setState(() {

      });
    }
  }
}
