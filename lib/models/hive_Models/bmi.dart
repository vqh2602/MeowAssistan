import 'package:hive/hive.dart';

part 'bmi.g.dart';

@HiveType(typeId: 2)
class BMI extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime dayAdd;
  @HiveField(2)
  double ribCage;
  @HiveField(3)
  double legLength;

  BMI({required this.id,required this.dayAdd,required this.ribCage,required this.legLength});
}