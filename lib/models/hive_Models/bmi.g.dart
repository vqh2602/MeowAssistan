// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BMIAdapter extends TypeAdapter<BMI> {
  @override
  final int typeId = 2;

  @override
  BMI read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BMI(
      id: fields[0] as int,
      dayAdd: fields[1] as DateTime,
      ribCage: fields[2] as double,
      legLength: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BMI obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dayAdd)
      ..writeByte(2)
      ..write(obj.ribCage)
      ..writeByte(3)
      ..write(obj.legLength);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BMIAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
