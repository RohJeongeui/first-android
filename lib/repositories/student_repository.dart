import 'package:connect_1000/models/profile.dart';
import 'package:connect_1000/models/student.dart';
import 'package:connect_1000/services/api_services.dart';

// class StudentRespository {
//   final ApiService api = ApiService();
//   Future<bool> dangkyLop() async{
//     bool kq = false;
//     var response = await api.dangkyLop();
//     if(response != null){
//       kq = true;
//     }
//     return kq;
//   }
//   Future<Student> getStudentInfo() async{
//     Student student = Student();
//     var response = await api.getUserInfo();
//     if(response != null){
//       var data = response.data;
//       student = Student.fromJson(data);
//       // Profile().student = Student.fromStudent(student);
//     }
//     return student;
//   }
// }

class StudentRepository {
  final ApiService api = ApiService();
  Future<bool> dangkyLop() async {
    bool kq = false;
    var response = await api.dangkyLop();
    if (response != null) {
      kq = true;
      //Profile().student = Student.fromStudent(student);
    }
    return kq;
  }

  Future<Student> getStudentInfo() async {
    Student student = Student();
    var response = await api.getStudentInfo();
    if (response != null) {
      var data = response.data;
      student = Student.fromJson(data);
      //Profile().student = Student.fromStudent(student);
    }

    return student;
  }
}