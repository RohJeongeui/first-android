import 'package:flutter/material.dart';

class MenuBarViewModel with ChangeNotifier {
  Offset offset = Offset(0, 0);
  void setOffset(Offset offset) {
    this.offset = offset;
    notifyListeners();
  }
}
