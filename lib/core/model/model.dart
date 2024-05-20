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

List<EmployeeDataModel> myData = [
  EmployeeDataModel(
      name: "Khaliq",
      phone: "09876543",
      joinDate: DateTime.parse("2027-03-04 06:06:48")),
  EmployeeDataModel(
      name: "David",
      phone: "6464646",
      joinDate: DateTime.parse("2011-05-04 06:06:48")),
  EmployeeDataModel(
      name: "Kamal",
      phone: "8888",
      joinDate: DateTime.parse("2021-06-08 06:06:48")),
  EmployeeDataModel(
      name: "Ali", phone: "3333333", joinDate: DateTime.parse("2023-03-23")),
  EmployeeDataModel(
      name: "Muzal",
      phone: "987654556",
      joinDate: DateTime.parse("2013-03-12 06:06:48")),
  EmployeeDataModel(
      name: "Taimu",
      phone: "46464664",
      joinDate: DateTime.parse("2021-12-06 06:06:48")),
  EmployeeDataModel(
      name: "Mehdi",
      phone: "5353535",
      joinDate: DateTime.parse("2019-03-04 06:06:48")),
  EmployeeDataModel(
      name: "Rex",
      phone: "244242",
      joinDate: DateTime.parse("2015-03-04 06:06:48")),
  EmployeeDataModel(
      name: "Alex",
      phone: "323232323",
      joinDate: DateTime.parse("2020-05-21 06:06:48")),
];
