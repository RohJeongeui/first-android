class Lop{
  int id;
  String ten;
  int idkhoa;
  int trangthai;
  Lop({
    this.id = 0,
    this.ten = "",
    this.idkhoa = 0,
    this.trangthai = 0
  });
  factory Lop.fromJson(Map<String, dynamic> json){
    return Lop(
      id: json['id'],
      ten: json['ten'],
      idkhoa: json['idkhoa'],
      trangthai: json['trangthai']
    );
  }
  factory Lop.fromLop(Lop lop){
    return Lop(
      id: lop.id,ten:lop.ten,idkhoa: lop.idkhoa,trangthai: lop.trangthai
    );
  }
}