import 'package:connect_1000/models/student.dart';
import 'package:connect_1000/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  static final Profile _instance = Profile._internal();
  Profile._internal({this.token = ""});
  factory Profile() {
    return _instance;
  }

  late SharedPreferences _pref;
  late String token;
  Student student = Student();
  User user = User();
  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
    token = "";
  }

  Future<void> setUsernamePassword(String username, String password) async {
    _pref.setString("username", username);
    _pref.setString("password", password);
  }

  String get username => _pref.getString('username') ?? '';
  String get password => _pref.getString('password') ?? '';
}
