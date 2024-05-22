// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:maninfini_task/domain/model/model.dart';

const Color dividerGreyColor = Color.fromRGBO(229, 229, 229, 1);

const Color detailsTextGreyColor = Color.fromRGBO(148, 156, 158, 1);

const Color whiteColor = Colors.white;

ThemeData themeData = ThemeData(
  datePickerTheme: const DatePickerThemeData(backgroundColor: whiteColor),
  cardTheme: const CardTheme(
    elevation: 0.0,
  ),
  useMaterial3: true,
);

const String employeeBoxName = "employeedata";
List<EmployeeDataModel> employees = [
  EmployeeDataModel(
      name: "Alice Smith",
      phone: "+1234567890",
      joinDate: DateTime.parse("2023-01-15")),
  EmployeeDataModel(
      name: "Bob Johnson",
      phone: "+1234567891",
      joinDate: DateTime.parse("2023-02-20")),
  EmployeeDataModel(
      name: "Charlie Brown",
      phone: "+1234567892",
      joinDate: DateTime.parse("2023-03-10")),
  EmployeeDataModel(
      name: "David Wilson",
      phone: "+1234567893",
      joinDate: DateTime.parse("2023-04-25")),
  EmployeeDataModel(
      name: "Eve Davis",
      phone: "+1234567894",
      joinDate: DateTime.parse("2023-05-30")),
  EmployeeDataModel(
      name: "Frank Miller",
      phone: "+1234567895",
      joinDate: DateTime.parse("2023-06-05")),
  EmployeeDataModel(
      name: "Grace Lee",
      phone: "+1234567896",
      joinDate: DateTime.parse("2023-07-15")),
  EmployeeDataModel(
      name: "Hank Moore",
      phone: "+1234567897",
      joinDate: DateTime.parse("2023-08-10")),
  EmployeeDataModel(
      name: "Ivy Taylor",
      phone: "+1234567898",
      joinDate: DateTime.parse("2023-09-25")),
  EmployeeDataModel(
      name: "Jack Anderson",
      phone: "+1234567899",
      joinDate: DateTime.parse("2023-10-05")),
  EmployeeDataModel(
      name: "Karen Thomas",
      phone: "+1234567810",
      joinDate: DateTime.parse("2023-11-15")),
  EmployeeDataModel(
      name: "Leo Harris",
      phone: "+1234567811",
      joinDate: DateTime.parse("2023-12-01")),
  EmployeeDataModel(
      name: "Mona Martin",
      phone: "+1234567812",
      joinDate: DateTime.parse("2024-01-05")),
  EmployeeDataModel(
      name: "Nina Clark",
      phone: "+1234567813",
      joinDate: DateTime.parse("2024-02-15")),
  EmployeeDataModel(
      name: "Oscar Lewis",
      phone: "+1234567814",
      joinDate: DateTime.parse("2024-03-01")),
  EmployeeDataModel(
      name: "Paul King",
      phone: "+1234567815",
      joinDate: DateTime.parse("2024-04-10")),
  EmployeeDataModel(
      name: "Quincy Adams",
      phone: "+1234567816",
      joinDate: DateTime.parse("2024-05-20")),
  EmployeeDataModel(
      name: "Rachel Green",
      phone: "+1234567817",
      joinDate: DateTime.parse("2024-06-30")),
  EmployeeDataModel(
      name: "Sam Carter",
      phone: "+1234567818",
      joinDate: DateTime.parse("2024-07-25")),
  EmployeeDataModel(
      name: "Tina Brooks",
      phone: "+1234567819",
      joinDate: DateTime.parse("2024-08-15"))
];
