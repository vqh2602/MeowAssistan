import 'package:hive/hive.dart';

import 'dart:async';

import '../worm.dart';



class WormDatabase {
  final String _boxName = "Wormdb";
  // open a box
  Future<Box> catBox() async {
    var box = await Hive.openBox<Worm>(_boxName);
    return box;
  }
  // get full note
  Future<List<Worm>> getFullCat(int id) async {
    print('id cat -> vaccine: $id');
    final box = await catBox();
    List<Worm> cats =  box.values.where((element) => element.id == id ).toList() as List<Worm>;
    // List<BMI> cats =  box.values.toList() as List<BMI>;
    return cats;
  }
  // to add data in box
  Future<void> addToBox(Worm cat) async {
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
  Future<void> updateCat(int index, Worm cat) async {
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


