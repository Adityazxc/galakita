import 'package:flutter/material.dart';

class FormDataUndanangan extends ChangeNotifier {
  String judulUndangan = '';
  String alamatWebsite = ' ';
  String mempelaiPria = '';
  String mempelaiWanita = '';
  String lokasi = '';
  String tanggalPernikahan = '';
  String ceritaCinta = '';
  String quote = '';
  String jamAwal = '';
  String jamAkhir = '';
  String pilihPaket= '';
  String idPaket='';


  void updateDataUndangan(
    String newJudulUndangan,
    String newAlamatWebsite,
  ) {
    judulUndangan = newJudulUndangan;
    alamatWebsite = newAlamatWebsite;

    notifyListeners(); //untuk memberitahu listenenr (widget) bahwa data berubah
  }

  void updateDetailUndangan(
    String newMempelaiPria,
    String newMempelaiWanita,
    String newLokasi,
    String newTanggalPernikahan,
    String newCeritaCinta,
    String newQuote,
      String newJamAwal,
      String newJamAkhir,
  ) {
    mempelaiPria = newMempelaiPria;
    mempelaiWanita = newMempelaiWanita;
    lokasi = newLokasi;
    tanggalPernikahan = newTanggalPernikahan;
    ceritaCinta = newCeritaCinta;
    quote = newQuote;
    jamAwal=newJamAwal;
    jamAkhir=newJamAkhir;
    notifyListeners(); //untuk memberitahu listenenr (widget) bahwa data berubah
  }

  void updatePilihPaket(
      // String newPilihPaket,
      String newIdPaket,
      ){
    // pilihPaket=newPilihPaket;
    idPaket=newIdPaket;
    notifyListeners();
  }
}
