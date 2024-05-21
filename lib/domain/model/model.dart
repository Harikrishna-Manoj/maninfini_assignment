import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class EmployeeDataModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? phone;

  @HiveField(2)
  DateTime? joinDate;

  EmployeeDataModel(
      {required this.name, required this.phone, required this.joinDate});
}
