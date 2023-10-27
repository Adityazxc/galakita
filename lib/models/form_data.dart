import 'package:flutter/material.dart';

class FormDataUndanangan extends ChangeNotifier {
  String judul = '';
  String alamatWebsite = ' ';
  String mempelaiPria = '';
  String mempelaiWanita = '';
  String lokasi = '';
  String tanggalPernikahan = '';
  String ceritaCinta = '';
  String quote = '';

  void updateDataUndangan(
    String newJudul,
    String newAlamatWebsite,
  ) {
    judul = newJudul;
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
  ) {
    mempelaiPria = newMempelaiPria;
    mempelaiWanita = newMempelaiWanita;
    lokasi = newLokasi;
    tanggalPernikahan = newTanggalPernikahan;
    ceritaCinta = newCeritaCinta;
    quote = newQuote;
    notifyListeners(); //untuk memberitahu listenenr (widget) bahwa data berubah
  }
}
