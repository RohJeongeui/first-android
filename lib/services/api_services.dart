import 'dart:convert';
import 'dart:io';
import 'package:connect_1000/models/profile.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
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

  void initialize() {
    _dio = Dio(BaseOptions(responseType: ResponseType.json));
  }
   Future<void> uploadAvatarToSever(File imageFile) async {
    Profile profile = Profile();
    Map<String, String> headers = {
      'Content-Type': "application/json; charset=UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json'
    };
    FormData formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(imageFile.path)});
    await _dio.post('https://chocaycanh.club/public/api/me/avatar',
        data: formData, options: Options(headers: headers));
  }
  Future<List<dynamic>?> getlistCity() async {
    Profile profile = Profile();
    String api_url = "https://chocaycanh.club/api/getjstinh";
    Map<String, String> headers = {
      'Content-Type': "application/json; charset=UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json'
    };
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(api_url), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<dynamic>?> getlistDistrict(int id) async {
    Profile profile = Profile();
    String api_url =
        "https://chocaycanh.club/api/getjshuyen?id=" + id.toString();
    Map<String, String> headers = {
      'Content-Type': "applocation/json; charset =UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json',
    };
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(api_url), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      return null;
    }
  }
  
  Future<List<dynamic>?> getlistWard(int id) async {
    Profile profile = Profile();
    String api_url = "https://chocaycanh.club/api/getjsxa?id=" + id.toString();
    Map<String, String> headers = {
      'Content-type': "application/json; charset=UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json',
    };
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(api_url), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Response?> updateProfile() async {
    Profile profile = Profile();
    Map<String, String> headers = {
      'Content-Type': "applocation/json; charset =UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json',
    };
    String birthday = "";
    if (profile.user.birthday.isNotEmpty) {
      String temp = profile.user.birthday;
      int ti = temp.indexOf('/', 0);
      String subday = temp.substring(0, ti);
      int tm = temp.indexOf('/', ti + 1);
      String submonth = temp.substring(ti + 1, tm);
      String subyear = temp.substring(tm + 1, temp.length);
      birthday = subyear + '-' + submonth + '-' + subday;
    }
    Map<String, dynamic> param = {
      "first_name": profile.user.first_name,
      "last_name": '',
      "phone": profile.user.phone,
      "address": profile.user.address ?? "",
      "provinceid": profile.user.provinceid,
      "provincename": profile.user.provincename ?? "",
      "districtid": profile.user.districtid,
      "districtname": profile.user.districtname ?? "",
      "wardid": profile.user.wardid,
      "warname": profile.user.wardname ?? "",
      "street": profile.user.address ?? "",
      'birthday': birthday,
    };
    String apiUrl = "https://chocaycanh.club/api/me/details";
    try {
      // ignore: non_constant_identifier_names
      final Response = await _dio.patch(apiUrl,
          options: Options(headers: headers), data: jsonEncode(param));
      if (Response.statusCode == 200) {
        print(Response);
        return Response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Response?> dangkyLop() async {
    Profile profile = Profile();
    Map<String, String> headers = {
      'Content-Type': "applocation/json; charset =UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json',
    };
    Map<String, dynamic> param = {
      "id": profile.student.idlop,
      "mssv": profile.student.mssv
    };
    String apiUrl = "https://chocaycanh.club/api/lophoc/dangky";
    try {
      // ignore: non_constant_identifier_names
      final Response = await _dio.post(apiUrl,
          options: Options(headers: headers), data: jsonEncode(param));
      if (Response.statusCode == 200) {
        return Response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Response?> getDSLop() async {
    Map<String, String> headers = {
      'Content-Type': "application/json; charset=UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json'
    };
    String apiUrl = "https://chocaycanh.club/api/lophoc/ds";
    try {
      final Response =
          await _dio.get(apiUrl, options: Options(headers: headers));
      if (Response.statusCode == 200) {
        return Response;
      }
    } catch (e) {
        print(e);
      }
    return null;
  }

  Future<Response?> getStudentInfo() async {
    Map<String, String> headers = {
      'Content-Type': "application/json; charset=UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json'
    };

    String apiUrl = "https://chocaycanh.club/api/sinhvien/info";
    try {
      final response =
          await _dio.get(apiUrl, options: Options(headers: headers));
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Response?> getUserInfo() async {
    Map<String, String> headers = {
      'Content-Type': "application/json; charset=UTF-8",
      'Authorization': 'Bearer ' + Profile().token,
      'Accept': 'application/json'
    };
    String apiUrl = "https://chocaycanh.club/api/me";
    try {
      // ignore: non_constant_identifier_names
      final Response =
          await _dio.get(apiUrl, options: Options(headers: headers));
      if (Response.statusCode == 200) {
        return Response;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
  // Future<Response?> getUserInfo() async {
  //   Map<String, String> headers = {
  //     'Content-Type': "application/json; charset=UTF-8",
  //     'Authorization': 'Bearer ' + Profile().token,
  //     'Accept': 'application/json'
  //   };
  //   String apiUrl = "https://chocaycanh.club/api/me";
  //   try {
  //     final response =
  //         await _dio.get(apiUrl, options: Options(headers: headers));
  //     if (response.statusCode == 200) {
  //       return response;
  //       print(response);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }

  Future<Response?> loginUser(String username, String password) async {
    Map<dynamic, dynamic> param = {
      "username": username,
      "password": password,
      "device_name": "android"
    };
    Map<String, String> headers = {
      'Content-type': "application/json; charset=UTF-8",
    };
    try {
      // ignore: non_constant_identifier_names
      final Response = await _dio.post(url_login,
          data: jsonEncode(param), options: Options(headers: headers));
      if (Response.statusCode == 200) {
        return Response;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Response?> registerUser(
      String email, String username, String password) async {
    Map<dynamic, dynamic> param = {
      "username": username,
      "email": email,
      "password": password,
      "password_confirmation": password,
      "tos": "true"
    };
    Map<String, String> headers = {
      'Content-type': "application/json; charset=UTF-8",
    };
    try {
      // ignore: non_constant_identifier_names
      final Response = await _dio.post(url_register,
          data: jsonEncode(param), options: Options(headers: headers));
      if (Response.statusCode == 201) {
        print(Response.data);
        return Response;
      }
    } catch (e) {
      if (e is DioException) {
        print(e.response);
      }
    }
    return null;
  }

  Future<Response?> forgotPassword(String email) async {
    Map<dynamic, dynamic> param = {
      "email": email,
    };
    Map<String, String> headers = {
      'Content-type': "application/json; charset=UTF-8",
    };
    try {
      // ignore: non_constant_identifier_names
      final Response = await _dio.post(url_forgot,
          data: jsonEncode(param), options: Options(headers: headers));
      if (Response.statusCode == 200) {
        return Response;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
