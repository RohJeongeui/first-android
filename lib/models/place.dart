class Place {
  int id;
  String name;
  Place(this.id, this.name);
}

class City extends Place {
  City({required id, required name}) : super(id, name);
  factory City.fromJson(Map<String, dynamic> json) {
    return City(id: json['ProvinceID'], name: json['ProvinceName']);
  }
}

class District extends Place {
  int level;
  District({required id, required name, required this.level}) : super(id, name);
  factory District.fromJson(Map<String, dynamic> json) {
    return District(
        id: json['DistrictID'],
        name: json['DistrictName'],
        level: json['Type']);
  }
}

class Ward extends Place {
  Ward({required id, required name}) : super(id, name);
  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(id: int.parse(json['WardCode']), name: json['WardName']);
  }
}
