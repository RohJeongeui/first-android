class Student {
  int iduser;
  String mssv;
  int idlop;
  String tenlop;
  int diem;
  int duyet;
  Student({this.iduser= 0 ,this.mssv = "",this.idlop = 0,
          this.tenlop = "",this.diem = 0,this.duyet = 0});
  factory Student.fromJson(Map<String,dynamic> json ){
    return Student(
      iduser:json['iduser'],
      mssv: json['mass'],
      idlop: json['idlop'],
      tenlop: json['tenlop'],
      diem: json['diem'],
      duyet: json['duyet']
    );
  }
  factory Student.fromStudent(Student student){
    return Student(
      iduser: student.iduser,
      mssv: student.mssv,
      idlop: student.idlop,
      tenlop: student.tenlop,
      diem: student.diem,
      duyet: student.duyet
    );
  }
}