import 'dart:convert';

import 'package:connect_1000/models/profile.dart';
import 'package:dio/dio.dart';

class ApiService{
  static final ApiService _instance = ApiService._internal();
  ApiService._internal();
  factory ApiService() {
    return _instance;
  }
  // ignore: non_constant_identifier_names
  final url_login = "https://chocaycanh.club/public/api/login";
  final url_register = "https://chocaycanh.club/public/api/register";
  final url_forgot = "https://chocaycanh.club/public/api/password/remind";
  late Dio _dio;
 
  void initialize(){
    _dio = Dio(BaseOptions(responseType: ResponseType.json));
  }

  Future<Response?> getStudentInfo() async{
    Map <String , String > headers = {
      'Content-Type' :"applocation/json; charset =UTF-8",
      'Authorizatiion' :'Bearer '+Profile().token,
      'Accept':'application/json',
    };
    String apiUrl = "https://chocaycanh.club/api/sinhvien/info";
    try{
          // ignore: non_constant_identifier_names
          final Response = await _dio.get(apiUrl,options: Options(headers: headers));
          if(Response.statusCode == 200 ) {
            return Response;
          }
      } catch(e) {
        print(e);
      }
      return null;
  }


  Future<Response?> loginUser(String username , String password) async
  {
    Map<dynamic ,dynamic> param = {
      "username" :username,
      "password" :password,
      "device_name":"android"
    };
    Map<String , String > headers = {
      'Content-type': "application/json; charset=UTF-8",
    };
    try{
        // ignore: non_constant_identifier_names
        final Response = await _dio.post(url_login,
                        data: jsonEncode(param),options: Options(headers: headers));
        if(Response.statusCode == 200 ) {
          return Response;
        }
    } catch(e) {
      print(e);
    }
    return null;
    
  }
  Future <Response?> registerUser( String email , String username , String password)
  async {
    Map<dynamic ,dynamic> param = {
      "username" :username,
      "email" :email,
      "password" :password,
      "password_confirmation" :password,
      "tos":"true"
    };
    Map<String , String > headers = {
      'Content-type': "application/json; charset=UTF-8",
    };
    try{
        // ignore: non_constant_identifier_names
        final Response = await _dio.post(url_register,
              data: jsonEncode(param),options: Options(headers: headers));
        if(Response.statusCode == 201 ) {
          print(Response.data);
          return Response;
        }
    } catch(e) {
        if(e is DioException){
          print(e.response);
        }
    }
    return null;
  }
  Future<Response?> forgotPassword(String email) async
  {
    Map<dynamic ,dynamic> param = {
      "email" :email,
    };
    Map<String , String > headers = {
      'Content-type': "application/json; charset=UTF-8",
    };
    try{
        // ignore: non_constant_identifier_names
        final Response = await _dio.post(url_forgot,
                        data: jsonEncode(param),options: Options(headers: headers));
        if(Response.statusCode == 200 ) {
          return Response;
        }
    } catch(e) {
      print(e);
    }
    return null;
    
  }

}