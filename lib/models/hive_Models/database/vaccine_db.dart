import 'package:hive/hive.dart';

import 'dart:async';

import 'package:meowassistan/models/hive_Models/vaccine.dart';



class VaccineDatabase {
  final String _boxName = "Vaccinedb";
  // open a box
  Future<Box> catBox() async {
    var box = await Hive.openBox<Vaccine>(_boxName);
    return box;
  }
  // get full note
  Future<List<Vaccine>> getFullCat(int id) async {
    print('id cat -> vaccine: $id');
    final box = await catBox();
    List<Vaccine> cats =  box.values.where((element) => element.id == id ).toList() as List<Vaccine>;
    // List<BMI> cats =  box.values.toList() as List<BMI>;
    return cats;
  }
  // to add data in box
  Future<void> addToBox(Vaccine cat) async {
    final box = await catBox();

    await box.add(cat);
    print('addtobox');
  }
  // delete data from box
  Future<void> deleteFromBox(int index) async {
    final box = await catBox();
    await box.deleteAt(index);
  }
  // delete all data from box
  Future<void> deleteAll() async {
    final box = await catBox();
    await box.clear();
  }
  // update data
  Future<void> updateCat(int index, Vaccine cat) async {
    final box = await catBox();
    await box.putAt(index, cat);
  }
  Future<void> truyvan(int id) async {
    final box = await catBox();
    // var filteredUsers = box.values.where((element) => element.id == 00 ).toList();
    // print( await filteredUsers.length);
    final Map deliveriesMap = box.toMap();
    dynamic desiredKey;
    deliveriesMap.forEach((key, value){
      if (value.id == id) {
        desiredKey = key;
      }
    });
    box.delete(desiredKey);
    print('delete: $desiredKey');
  }
}


