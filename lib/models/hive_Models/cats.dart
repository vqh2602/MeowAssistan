
import 'package:hive/hive.dart';

part 'cats.g.dart';

@HiveType(typeId: 1)
class Cat{
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final DateTime? birt;
  // đực true, cái false
  @HiveField(3)
  final bool? sex;
  // id hình hảnh
  @HiveField(5)
  String? imageUrl;

  Cat({this.id,this.name,this.birt,this.sex, this.imageUrl});

}