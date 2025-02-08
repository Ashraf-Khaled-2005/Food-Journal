// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodEntityAdapter extends TypeAdapter<FoodEntity> {
  @override
  final int typeId = 0;

  @override
  FoodEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodEntity(
      description: fields[0] as String,
      imageUrl: fields[1] as String,
      data: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FoodEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
