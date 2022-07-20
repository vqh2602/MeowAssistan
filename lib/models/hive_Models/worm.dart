import 'package:hive/hive.dart';

part 'worm.g.dart';
@HiveType(typeId: 4)
class Worm extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime dayAdd;

  Worm({required this.id,required this.dayAdd});
}