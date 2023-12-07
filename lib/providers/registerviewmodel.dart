import 'package:connect_1000/repositories/register_reposotory.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  int status = 0;
  String errorMessage = "";
  bool agree = false;
  final RegisterRepo = RegisterRepository();
  String Quydinh =
      "Khi tham gia vào ứng dụng các bạn đồng ý với các điều khản sau:\n" +
          "1. Các thông tin của bạn sẽ được chia sẻ với các thành học\n" +
          "2. Thông tin của bạn có thể ảnh hưởng học tập ở trường" +
          "3. Thông tin của bạn sẽ được xoá vĩnh viễn khi có yêu cầu xoá thông tin";
  void setAgree(bool value) {
    agree = value;
    notifyListeners();
  }

  Future<void> register(
      String username, String password1, String password2, String email) async {
    status = 1;
    notifyListeners();
    errorMessage = "";
    if (agree == false) {
      status = 2;
      errorMessage = "Bạn phải đồng ý điều khoản trước khi đăng ký!\n";
    }
    if (email.isEmpty || username.isEmpty || password1.isEmpty) {
      status = 2;
      errorMessage += "Email, username, password không được để trống\n";
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid == false) {
      status = 2;
      errorMessage += "Email không hợp lệ!\n ";
    }
    if (password1.length < 8) {
      status = 2;
      errorMessage += "Password cần lớn hơn 8 chữ! \n ";
    }
    if (password1 != password2) {
      status = 2;
      errorMessage = "Mật khẩu không trùng nhau!";
    }
    if (status != 2) {
      status = await RegisterRepo.register(email, username, password1);
    }

    ///sử dụng repository gọi hàm login va lấy kết quả
    notifyListeners();
  }
}
