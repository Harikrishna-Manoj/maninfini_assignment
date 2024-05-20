// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeDataModelAdapter extends TypeAdapter<EmployeeDataModel> {
  @override
  final int typeId = 0;

  @override
  EmployeeDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeDataModel(
      name: fields[0] as String?,
      phone: fields[1] as int?,
      joinDate: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.joinDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
