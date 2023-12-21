import 'package:connect_1000/repositories/place_respository.dart';
import 'package:flutter/material.dart';

import '../models/place.dart';

class DiachiModel with ChangeNotifier {
  List<City> listCity = [];
  List<District> listDistrict = [];
  List<Ward> listWard = [];
  int curCityid = 0;
  int curDistid = 0;
  int curWardid = 0;
  String address = "";
  Future<void> initialize(int Cid, int Did, int Wid) async {
    curCityid = Cid;
    curDistid = Did;
    curWardid = Wid;
    final repo = PlaceRepository();
    listCity = await repo.getListCity();
    if (curCityid != 0) {
      listDistrict = await repo.getListDistrict(curCityid);
    }
    if (curDistid != 0) {
      listWard = await repo.getListWard(curDistid);
    }
  }

  Future<void> setCity(int Cid) async {
    if (Cid != curCityid) {
      curCityid = Cid;
      curDistid = 0;
      curWardid = 0;
      final repo = PlaceRepository();
      listDistrict = await repo.getListDistrict(curCityid);
      listWard.clear();
    }
  }

  Future<void> setDistrict(int Did) async {
    if (Did != curDistid) {
      curDistid = Did;
      curWardid = 0;
      final repo = PlaceRepository();
      listWard = await repo.getListWard(curDistid);
    }
  }

  Future<void> setWard(int Wid) async {
    if (Wid != curWardid) {
      curWardid = Wid;
    }
  }
}
// class DiachiModel with ChangeNotifier {
//   List<City> listCity = [];
//   List<District> listDistrict = [];
//   List<Ward> listWard = [];
//   int curCityid = 0;
//   int curDistid = 0;
//   int curWardid = 0;
//   String address = "";
//   Future<void> initialize(int Cid, int Did, int Wid) async {
//     curCityid = Cid;
//     curDistid = Did;
//     curWardid = Wid;
//     final repo = PlaceRepository();
//     listCity = await repo.getListCity();
//     if (curCityid != 0) {
//       listDistrict = await repo.getListDistrict(curCityid);
//     }
//     if (curDistid != 0) {
//       listWard = await repo.getListWard(curDistid);
//     }
//   }

//   Future<void> setCity(int Cid) async {
//     if (Cid != curCityid) {
//       curCityid = Cid;
//       curDistid = 0;
//       curWardid = 0;
//       final repo = PlaceRepository();
//       listDistrict = await repo.getListDistrict(curCityid);
//       listWard.clear();
//     }
//   }

//   Future<void> setDistrict(int Did) async {
//     if (Did != curDistid) {
//       curDistid = Did;
//       curWardid = 0;
//       final repo = PlaceRepository();
//       listWard = await repo.getListWard(curDistid);
//       listWard.clear();
//     }
//   }

//   Future<void> setWard(int Wid) async {
//     if (Wid != curWardid) {
//       curWardid = Wid;
//     }
//   }
// }
