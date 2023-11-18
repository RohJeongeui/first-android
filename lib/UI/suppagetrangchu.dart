import 'package:flutter/material.dart';

import '../providers/mainviewmodel.dart';
import 'AppConstant.dart';

class SPageTrangchu extends StatelessWidget {
  const SPageTrangchu({super.key});
  static int idpage = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => MainViewModel().closeMenu(),
      child: Container(
        color: AppConstant.backgroundColor, 
        child: Center(
          child: Text("Trang chu"),)),
    );
  }
}
