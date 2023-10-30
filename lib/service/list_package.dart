import "dart:convert";
import "package:flutter/services.dart";


Future<List> allPackage() async {
  List _package = [];
  final String response = await rootBundle.loadString('assets/json/package.json');
  final data = json.decode(response);
  _package = data["data"];
  return _package;
}