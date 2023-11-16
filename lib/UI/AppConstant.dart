import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant{
  static TextStyle textfancyheader = GoogleFonts.lato(
    fontSize: 40, color: const Color.fromARGB(150, 100, 100, 100));
  static TextStyle text_error = const TextStyle(
    fontSize: 16, color: Colors.red, fontStyle: FontStyle.italic);
  static TextStyle textlink = TextStyle(color: Colors.blue[600], 
    fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle textlogo = GoogleFonts.lato(
    fontSize: 30, color: Colors.green ,fontWeight: FontWeight.bold);
}