import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/theme.dart';

Future<List> allTheme()async{
  List theme=[];
  final String response = await rootBundle.loadString('assets/json/themes.json');

  final data = json.decode(response);
  theme = data["data"];
  return theme;
}

