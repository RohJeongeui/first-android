import 'package:flutter/material.dart';

import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SPageYourprofile extends StatelessWidget {
  const SPageYourprofile({super.key});
  static int idpage = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => MainViewModel().closeMenu(),
      child: Container(
        color: AppConstant.backgroundColor, 
        child: Center(
          child: Text("Your Profile"),)),
    );
  }
}
