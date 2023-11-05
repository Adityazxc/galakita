import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gala_kita/models/form_data.dart';
import 'package:gala_kita/utils/global.colors.dart';
import 'package:gala_kita/views/navigations/navigation_bar.dart';
import 'package:gala_kita/views/invitation/form5.dart';
import 'package:gala_kita/views/widgets/button/button_add_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class FormInvitation4 extends StatefulWidget {
  const FormInvitation4({super.key});

  @override
  State<FormInvitation4> createState() => __FormInvitation4State();
}

class __FormInvitation4State extends State<FormInvitation4> {
  File? image;
//Untuk get image

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();

    //untuk pilih an image
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      setState(() {
        image = File(imagePicked!.path);
        final ImageProvider =
            Provider.of<FormDataUndanangan>(context, listen: false);
        ImageProvider.saveImage(File(imagePicked.path));
      });
    }
    //convert file Xfile ke file

    setState(() {});
  }

  Future getVideo() async {
    final ImagePicker _picker = ImagePicker();

    //untuk pilih video
    final XFile? galleryVideo =
        await _picker.pickVideo(source: ImageSource.gallery);

    setState(() {});
  }

  @override
  void inistate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Langkah 4 dari 5',
                  style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                StepProgressIndicator(
                  totalSteps: 5,
                  currentStep: 4,
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
                  child: Row(children: [
                    Icon(Icons.warning_amber, color: Colors.yellow),
                    const SizedBox(width: 10),
                    Text(
                      'Semua data bisa diedit setelah pembayaran ',
                      style: TextStyle(
                          color: GlobalColors.unselected,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
                const SizedBox(height: 20),
                //menampilkan image yang di pilih
                image != null
                    ? Container(
                        height: 150,
                        width: 150,
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ))
                    : Container(),
                Text(
                  'Foto Prewed ',
                  style: TextStyle(
                      color: GlobalColors.unselected,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: Container(
                    child: buttonAddFile(caption: 'Foto Cover (1)'),
                  ),
                  onTap: () async {
                    await getImage();
                  },
                ),

                const SizedBox(height: 20),
                Text(
                  'Gallery Prewed ',
                  style: TextStyle(
                      color: GlobalColors.unselected,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                InkWell(
                  child: Container(
                    child: const buttonAddFile(caption: 'Max 10 Foto'),
                  ),
                  onTap: () async {
                    await getVideo();
                  },
                ),
                const SizedBox(height: 20),

                Text(
                  'Video Preweding (Optional) ',
                  style: TextStyle(
                      color: GlobalColors.unselected,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                const buttonAddFile(caption: 'Max 10 Video'),
              ],
            ),
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
                child: Icon(Icons.keyboard_arrow_left),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                backgroundColor: GlobalColors.mainColor,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FormInvitation5();
                  }));
                },
                child: Icon(Icons.keyboard_arrow_right),
              ),
            ])));
  }
}
