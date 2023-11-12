import 'package:flutter/material.dart';
import 'package:gala_kita/models/db_invitation.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/invitation/button_close.dart';
import 'package:gala_kita/views/invitation/form2.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/invitation/get_list_theme.dart';
import 'package:gala_kita/views/widgets/text/text_form_global.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/list_theme.dart';

class FormInvitation extends StatefulWidget {
  const FormInvitation({super.key});

  @override
  State<FormInvitation> createState() => _FormInvitation();
}

class _FormInvitation extends State<FormInvitation> {
  List theme = [];
  List<Color> borderColors = [];
  int? categoryTheme = 1;
  int? selectedThemeIndex = 0;
  String previewUrlInvitation = '';

  final formKey = GlobalKey<FormState>();
  final TextEditingController titleInvitationController =
      TextEditingController();
  final TextEditingController urlWebInvitationController =
      TextEditingController();

  //koneksi ke sqflite
  final bool _isEditMode = true;
   bool _isLoading = true;
  List<Map<String, dynamic>> invitation = [];

// Insert a new data to the database

  Future<void> addItem(int themeId) async {
    final title = titleInvitationController.text;
    final url = urlWebInvitationController.text ;

    if (title.isNotEmpty && url.isNotEmpty) {
      await DatabaseHelper.createItem(title, url, themeId);
      // Simpan data form ke Shared Preferences
      saveFormDataLocally(title, url, themeId);
      _refreshData();
    }
  }

  // Update an existing data
  Future<void> updateItem(int id, int themeId) async {
    final title = titleInvitationController.text ;
    final url = urlWebInvitationController.text;

    if (title.isNotEmpty && url.isNotEmpty) {
      await DatabaseHelper.updateItem(id, title, url, themeId);

      //menyimpan data form ke Shared Preferences
      saveFormDataLocally(title, url, themeId);
      _refreshData();
    }
  }

  void saveFormDataLocally(String title, String url, int themeId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('savedTitle', title);
    prefs.setString('savedUrl', url);
    prefs.setInt('savedThemeId', themeId);
  }

  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      invitation = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadThemeData(categoryTheme);
    urlWebInvitationController.addListener(() {
      setState(() {
        previewUrlInvitation = urlWebInvitationController.text;
      });
    });
    _refreshData();
    _loadSavedFormData();
    //get data dari database
    DatabaseHelper.history();
  }

  void _loadSavedFormData() async {
    final formData = Provider.of<FormDataUndanangan>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    final savedTitle = prefs.getString('savedTitle') ?? '';
    final savedUrl = prefs.getString('savedUrl') ?? '';
    final savedThemeId = prefs.getInt('savedThemeId') ?? 1;


    setState(() {
      titleInvitationController.text = savedTitle;
      urlWebInvitationController.text = savedUrl;
      formData.updateSelectPackage(savedThemeId);

    });
  }

  void deleteItem(int id) async {
    await DatabaseHelper.deleteItem(id);

    // Membersihkan data form di Shared Preferences
    clearFormDataLocally();

    if(!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully deleted!'), backgroundColor: Colors.green));
    _refreshData();
  }

  void clearFormDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('savedTitle');
    prefs.remove('savedUrl');
  }

  Future<void> loadThemeData(categoryTheme) async {
    final themeData = await allTheme();
    final filteredTheme = <Map<String, dynamic>>[];
    final categories = <int>{}; //agar data tidak double

    for(var theme  in themeData) {
      final categoryId = theme['categoryId'];
      if (!categories.contains(categoryId)) {
        // Menambahkan kategori unik ke daftar kategori
        categories.add(categoryId);
      }
      if (categoryId == categoryTheme) {
        //mengganti '1' dengan ID kategori yang ingin di
        filteredTheme.add(theme);
      }
    };

    setState(() {
      theme = filteredTheme;
      borderColors = List.generate(theme.length, (index) => Colors.white);
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

    int? id;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(right: 15.0, left: 15.0, bottom: 15.0),
        child: Form(
            key: formKey,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ButtonClose(text: "Langkah 1 dari 5", currentStep: 1),
                  Text(
                    'Judul Undangan ',
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 15),
                  // TextFormField(
                  //   controller: titleInvitationController,
                  //   decoration: InputDecoration(
                  //     hintText: 'Undangan Benno Tyas',
                  //   ),
                  //
                  //   obscureText: false,
                  //   keyboardType: TextInputType.multiline,
                  //   onChanged: (value) {
                  //     // Aksi yang akan dijalankan saat nilai formulir berubah
                  //     // Di sini, kita tidak memerlukan tombol "Update", karena pembaruan otomatis terjadi setiap kali formulir berubah.
                  //     setState(() {
                  //       // Update data yang ada
                  //       formData.updateDataInvitation(
                  //           titleInvitationController.text,
                  //           urlWebInvitationController.text);
                  //     });
                  //   },
                  // ),

                  TextFormGlobal(
                    controller: titleInvitationController,
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
                    controller: urlWebInvitationController,
                    text: 'benno-tyas',
                    error: "Alamat Website tidak boleh kosong",
                    obscure: false,
                    textInputType: TextInputType.text,
                  ),
                  // TextFormField(
                  //   controller: urlWebInvitationController,
                  //   decoration: InputDecoration(
                  //     hintText: 'Alamat Website tidak boleh kosong',
                  //   ),
                  //
                  //   obscureText: false,
                  //   keyboardType: TextInputType.multiline,
                  //   onChanged: (value) {
                  //     // Aksi yang akan dijalankan saat nilai formulir berubah
                  //     // Di sini, kita tidak memerlukan tombol "Update", karena pembaruan otomatis terjadi setiap kali formulir berubah.
                  //     setState(() {
                  //       // Update data yang ada
                  //       formData.updateDataInvitation(
                  //           titleInvitationController.text,
                  //           urlWebInvitationController.text);
                  //     });
                  //   },
                  // ),
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
                            DropdownMenuItem<int>(
                                value: 2, child: Text("Dark")),
                            DropdownMenuItem<int>(value: 3, child: Text("all")),
                          ],
                          onChanged: (int? newValue) {
                            setState(() {
                              categoryTheme = newValue;
                            });
                            // Mengambil ID tema yang sesuai dengan kategori yang dipilih
                            final selectedTheme = theme.firstWhere(
                                (theme) => theme['categoryID'] == categoryTheme,
                                orElse: () => <String, dynamic>{});

                            if (selectedTheme.isNotEmpty) {
                              final idTheme = selectedTheme['id'].toString();

                              final saveTheme = Provider.of<FormDataUndanangan>(
                                  context,
                                  listen: false);
                              saveTheme.updateSelectPackage(int.parse(idTheme));
                              print("ini kategori theme $newValue");
                              loadThemeData(categoryTheme);

                            }
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
                            final int idTheme = data['id'];
                            final saveTheme = Provider.of<FormDataUndanangan>(
                                context,
                                listen: false);
                            saveTheme.updateSelectTheme(idTheme);
                            print("ini id theme $idTheme dengan type data ${idTheme.runtimeType}");
                            print("ini selectedThemeIndex $selectedThemeIndex dengan type data ${selectedThemeIndex.runtimeType}");
                          },
                          child:
                              getListTheme(context, data, borderColors[index]),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: invitation.length,
                      itemBuilder: (context, index) => Card(
                        color:
                            index % 2 == 0 ? Colors.green : Colors.green[200],
                        margin: const EdgeInsets.all(15),
                        child: ListTile(
                            title: Text(invitation[index]['title']),
                            subtitle: Column(
                              children: [
                                Text(invitation[index]['url']),
                                // Text(invitation[index]['themeId']),
                              ],
                            ),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () =>
                                        deleteItem(invitation[index]['id']),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () =>
                                        deleteItem(invitation[index]['id']),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: GlobalColors.mainColor,
            onPressed: () async {
              final idTheme1 = formData.idTheme;
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(SnackBar(content: Text("ini adalah idTheme1 $idTheme1 dengan typedata ${idTheme1.runtimeType}")));

              print("ini adalah idTheme1 $idTheme1 dengan typedata ${idTheme1.runtimeType}");
              if (formKey.currentState != null &&
                  formKey.currentState!.validate() &&
                  selectedThemeIndex != null) {
                // if (invitation != null && invitation.isNotEmpty) {
                //   if (_isEditMode) {
                //     await addItem(idTheme1);
                //     // await updateItem(id!,idTheme1);
                //   } else {
                //     await addItem(idTheme1);
                //   }
                // } else {
                //   await addItem(idTheme1);
                // }
                  await addItem(idTheme1);
                //
                  if(!context.mounted) return;
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child:  FormInvitation2()));
              } else if (selectedThemeIndex == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pilih tema telebih dahulu")));
              }
            },
            child: const Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }


}

