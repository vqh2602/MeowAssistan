// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WormAdapter extends TypeAdapter<Worm> {
  @override
  final int typeId = 4;

  @override
  Worm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Worm(
      id: fields[0] as int,
      dayAdd: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Worm obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dayAdd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WormAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
