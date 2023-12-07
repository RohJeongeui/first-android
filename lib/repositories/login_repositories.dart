import 'package:connect_1000/models/profile.dart';
import 'package:connect_1000/services/api_services.dart';

class LoginRepository {
  final ApiService api = ApiService();
  Future<Profile> login(String username, String password) async {
    Profile profile = Profile();
    final response = await api.loginUser(username, password);
    if (response != null && response.statusCode == 200) {
      profile.token = response.data['token'];
      profile.setUsernamePassword(username, password);
    } else {
      profile.token = "";
    }
    return profile;
  }
}
