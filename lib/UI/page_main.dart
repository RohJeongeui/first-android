
import 'package:connect_1000/UI/AppConstant.dart';
import 'package:flutter/material.dart';

class PageMain extends StatelessWidget {
  const PageMain({super.key});
  static String routename = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.mainColor,
        leading: Icon (Icons.menu, color: Colors.white,
        ),),
      body: SafeArea(child: Stack(
        children: [
          Container(
            child: Center(
              child: Text ("body")
              ),),
          Text("main page"),
        ],
      )),
    );
  }
}
