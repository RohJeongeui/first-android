import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppConstant {
  static TextStyle textfancyheader = GoogleFonts.lato(
      fontSize: 40,
      color: const Color.fromARGB(150, 100, 100, 100),
      fontWeight: FontWeight.bold);

  static TextStyle textfancyheader_2 = GoogleFonts.lato(
      fontSize: 15,
      color: const Color.fromARGB(150, 100, 100, 100),
      fontWeight: FontWeight.bold);

  static TextStyle text_error = const TextStyle(
      fontSize: 16, color: Colors.red, fontStyle: FontStyle.italic);

  static TextStyle textlink = TextStyle(
      color: Colors.blue[600], fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle textbody = const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle textbody_2 = const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle textbodyfocus = TextStyle(
      color: Colors.blue[600], fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle textlogo = GoogleFonts.lato(
      fontSize: 30,
      color: const Color.fromARGB(255, 101, 209, 104),
      fontWeight: FontWeight.bold);
  static TextStyle textbodyWhite = const TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  static TextStyle textbodyWhiteBold = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static Color mainColor = const Color.fromARGB(255, 86, 158, 89);
  static Color backgroundColor = const Color.fromARGB(255, 210, 232, 236);
  static bool isDate(String str) {
    try {
      var inputFormat = DateFormat('dd/MM/yyyy');
      var date1 = inputFormat.parseStrict(str);
      return true;
    } catch (e) {
      return false;
    }
  }
}
