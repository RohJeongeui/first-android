import 'package:connect_1000/models/place.dart';
import 'package:connect_1000/services/api_services.dart';

class PlaceRepository {
  Future<List<City>> getListCity() async {
    List<City> list = [];
    list.add(City(id: 0, name: '--Chọn--'));
    var datas = await ApiService().getlistCity();
    if (datas != null) {
      for (var item in datas) {
        var city = City.fromJson(item);
        list.add(city);
      }
    }
    return list;
  }

  Future<List<District>> getListDistrict(int id) async {
    List<District> list = [];
    list.add(District(id: 0, name: '--Chọn--', level: 0));
    var datas = await ApiService().getlistDistrict(id);
    if (datas != null) {
      for (var item in datas) {
        var districtid = District.fromJson(item);
        list.add(districtid);
      }
    }
    return list;
  }

  Future<List<Ward>> getListWard(int id) async {
    List<Ward> list = [];
    list.add(Ward(id: 0, name: '--Chọn--'));
    var datas = await ApiService().getlistWard(id);
    if (datas != null) {
      for (var item in datas) {
        var ward = Ward.fromJson(item);
        list.add(ward);
      }
    }
    return list;
  }
}
