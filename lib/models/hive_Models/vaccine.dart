import 'package:hive/hive.dart';

part 'vaccine.g.dart';
@HiveType(typeId: 3)
class Vaccine extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime dayAdd;

  Vaccine({required this.id,required this.dayAdd});
}