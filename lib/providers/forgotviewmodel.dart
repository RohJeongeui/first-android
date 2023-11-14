import 'package:connect_1000/repositories/forgot_repository.dart';
import 'package:flutter/material.dart';

class ForgotViewmodel  with ChangeNotifier{
  final forgotRepo = ForgotRepository();
  String errorMessage = "";
  int status = 0;

  Future <void> forgotPassword(String email) async{
    errorMessage = "";
    status = 1;
    notifyListeners();
    final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
      if(emailValid == false){
        status = 2;
        errorMessage += "Email không hợp lệ!\n ";
      }
      if(status != 2){
        if (await forgotRepo.forgotpassword(email) == true) {
          status = 3;
        }else {
          status = 2;
          errorMessage = "Email không tồn tại!";
        }
      }
      notifyListeners();
  }
}