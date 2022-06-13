import 'package:hive/hive.dart';
import 'package:meowassistan/models/hive_Models/bmi.dart';

import 'dart:async';



class BMIDatabase {
  final String _boxName = "BMIdb";
  // open a box
  Future<Box> catBox() async {
    var box = await Hive.openBox<BMI>(_boxName);
    return box;
  }
  // get full note
  Future<List<BMI>> getFullCat(int id) async {
    print('id cat -> bmi: $id');
    final box = await catBox();
    List<BMI> cats =  box.values.where((element) => element.id == id ).toList() as List<BMI>;
    // List<BMI> cats =  box.values.toList() as List<BMI>;
    return cats;
  }
  // to add data in box
  Future<void> addToBox(BMI cat) async {
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
  Future<void> updateCat(int index, BMI cat) async {
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


