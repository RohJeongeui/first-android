import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant{
  static TextStyle textfancyheader = GoogleFonts.lato(
    fontSize: 40, color: const Color.fromARGB(150, 100, 100, 100),fontWeight: FontWeight.bold);
  
  static TextStyle textfancyheader_2 = GoogleFonts.lato(
    fontSize: 18, color: const Color.fromARGB(150, 100, 100, 100));
  
  static TextStyle text_error = const TextStyle(
    fontSize: 16, color: Colors.red, fontStyle: FontStyle.italic);
  
  static TextStyle textlink = TextStyle(color: Colors.blue[600], 
    fontSize: 16, fontWeight: FontWeight.bold);
  
  static TextStyle textbody = const TextStyle(color: Colors.black, 
    fontSize: 16, fontWeight: FontWeight.bold);
  
  static TextStyle textbodyfocus = TextStyle(color: Colors.blue[600], 
    fontSize: 20, fontWeight: FontWeight.bold);
  
  static TextStyle textlogo = GoogleFonts.lato(
    fontSize: 30, color: Color.fromARGB(255, 101, 209, 104) ,fontWeight: FontWeight.bold);
  
  static Color mainColor =  Color.fromARGB(255, 86, 158, 89);
  static Color backgroundColor =  Color.fromARGB(255, 210, 232, 236);
}