import 'package:flutter/material.dart';

class FormDataUndanangan extends ChangeNotifier {
  String titleInvitation = '';
  String urlWebInvitation = ' ';
  String mempelaiPria = '';
  String mempelaiWanita = '';
  String weddingLocation = '';
  String weddingDate = '';
  String loveStory = '';
  String quote = '';
  String eventStartTime = '';
  String eventTimeEnds = '';
  String selectPackage= '';
  String idPackage='';


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
      String newIdPackage,
      ){
    idPackage=newIdPackage;
    notifyListeners();
  }
}
