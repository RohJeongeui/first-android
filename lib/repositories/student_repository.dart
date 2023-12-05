import 'package:connect_1000/models/profile.dart';
import 'package:connect_1000/models/student.dart';
import 'package:connect_1000/services/api_services.dart';

class StudentRespository {
  final ApiService api = ApiService();
  Future<Student> getStudentInfo() async{
    Student student = Student();
    var response = await api.getUserInfo();
    if(response != null){
      var data = response.data;
      student = Student.fromJson(data);
      Profile().student = Student.fromStudent(student);
    }
    return student;
  }
}