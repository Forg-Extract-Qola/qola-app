// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TableEntityAdapter extends TypeAdapter<TableEntity> {
  @override
  final int typeId = 1;

  @override
  TableEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TableEntity(
      id: fields[0] as int?,
      name: fields[1] as String?,
      isOccupied: fields[2] as bool?,
      restaurantId: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TableEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isOccupied)
      ..writeByte(3)
      ..write(obj.restaurantId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TableEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
