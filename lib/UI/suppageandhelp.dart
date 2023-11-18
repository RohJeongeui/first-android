import 'package:flutter/material.dart';

import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SPagesupandhelp extends StatelessWidget {
  const SPagesupandhelp({super.key});
  static int idpage = 3;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => MainViewModel().closeMenu(),
      child: Container(
        color: AppConstant.backgroundColor, 
        child: Center(
          child: Text("Trợ giúp & hộ trợ"),)),
    );
  }
}