import 'dart:io';

import 'package:flutter/material.dart';

class FormDataUndanangan extends ChangeNotifier {
  // String titleInvitation = '';
  // String urlWebInvitation = ' ';
  // String mempelaiPria = '';
  // String mempelaiWanita = '';
  // String weddingLocation = '';
  // String weddingDate = '';
  // String loveStory = '';
  // String quote = '';
  // String eventStartTime = '';
  // String eventTimeEnds = '';
  // String selectPackage= '';
  // String idPackage='';
  // String idTheme='';

  String titleInvitation = '';
  String urlWebInvitation = '';
  String mempelaiPria = 'Benno Anggara';
  String mempelaiWanita = 'Tyas aja';
  String weddingLocation = 'Dipatiukur';
  String weddingDate = '16 februari 2022';
  String loveStory = 'lalalal';
  String quote = 'huhuy';
  String eventStartTime = '16:00';
  String eventTimeEnds = '17:00';
  String selectPackage= '5';
  int idPackage=2;
  int idTheme=0;

  File? _image;
  File? get image=> _image;
  
  void saveImage(File newImage){
    _image=newImage;
    notifyListeners();
  } 

  void updateDataInvitation(
    String newTitleInvitation,
    String newUrlWebInvitation,
  ) {
    titleInvitation = newTitleInvitation;
    urlWebInvitation = newUrlWebInvitation;

    notifyListeners(); //untuk memberitahu listenenr (widget) bahwa data berubah
  }

  void updateDetailInvitation(
    String newMempelaiPria,
    String newMempelaiWanita,
    String newWeddingLocation,
    String newWeddingDate,
    String newLoveStory,
    String newQuote,
      String newEventStartTime,
      String newEventTimeEnds,
  ) {
    mempelaiPria = newMempelaiPria;
    mempelaiWanita = newMempelaiWanita;
    weddingLocation = newWeddingLocation;
    weddingDate = newWeddingDate;
    loveStory = newLoveStory;
    quote = newQuote;
    eventStartTime=newEventStartTime;
    eventTimeEnds=newEventTimeEnds;
    notifyListeners(); //untuk memberitahu listenenr (widget) bahwa data berubah
  }

  void updateSelectPackage(
      int newIdPackage,
      ){
    idPackage=newIdPackage;
    notifyListeners();
  }

  void updateSelectTheme(
      int newIdTheme
      ) {
    idTheme=newIdTheme;
    notifyListeners();
  }
}
