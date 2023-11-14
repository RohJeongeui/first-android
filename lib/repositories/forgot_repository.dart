import 'package:connect_1000/services/api_services.dart';

class ForgotRepository {
  final ApiService api = ApiService();
  Future <bool> forgotpassword(String email) async{
    final response =  await api.forgotPassword(email);
    if( response != null) {
      return true ;
    }else{
      return false ;
    }
  }
}