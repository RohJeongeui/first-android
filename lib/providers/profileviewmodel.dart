import 'package:flutter/foundation.dart';

class ProfileViewModel with ChangeNotifier {
  int status = 0;
  void updateScreen() {
    notifyListeners();
  }
}
