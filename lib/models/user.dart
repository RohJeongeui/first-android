class User {
  int id;
  String first_name;
  String last_name;
  String username;
  String email;
  String phone;
  String avatar;
  String address;
  int role_id;
  String status;
  int provinceid;
  int districtid;
  int wardid;
  String provincename;
  String districtname;
  String wardname;
  String birthday;
  User(
      {this.id = 0,
      this.first_name = "",
      this.last_name = "",
      this.username = "",
      this.email = "",
      this.phone = "",
      this.avatar = "",
      this.address = "",
      this.role_id = 4,
      this.status = "Active",
      this.provinceid = 0,
      this.districtid = 0,
      this.wardid = 0,
      this.provincename = "",
      this.districtname = "",
      this.wardname = "",
      this.birthday = ""});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      first_name: json['first_name'] ?? "",
      last_name: json['last_name'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      avatar: json['avatar'] ?? "",
      address: json['address'] ?? "",
      role_id: json['role_id'] ?? 4,
      status: json['status'] ?? "",
      provinceid: json['provinceid'] ?? 0,
      districtid: json['districtid'] ?? 0,
      wardid: json['wardid'] ?? 0,
      provincename: json['provincename'] ?? "",
      districtname: json['districtname'] ?? "",
      wardname: json['wardname'] ?? "",
      birthday: json['birthday'] ?? "",
    );
  }
  factory User.fromUser(User value) {
    return User(
      id: value.id,
      first_name: value.first_name,
      last_name: value.last_name,
      username: value.username,
      email: value.email,
      phone: value.phone,
      avatar: value.avatar,
      address: value.address,
      role_id: value.role_id,
      status: value.status,
      provinceid: value.provinceid,
      districtid: value.districtid,
      wardid: value.wardid,
      provincename: value.provincename,
      districtname: value.districtname,
      wardname: value.wardname,
      birthday: value.birthday,
    );
  }
}