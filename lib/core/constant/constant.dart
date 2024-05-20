// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const Color blueColor = Color.fromRGBO(29, 161, 242, 1);

const Color containerGreyColor = Color.fromRGBO(242, 242, 242, 1);
const Color dividerGreyColor = Color.fromRGBO(229, 229, 229, 1);
const Color calendarDividerGreyColor = Color.fromRGBO(181, 181, 181, 1);

const Color detailsTextGreyColor = Color.fromRGBO(148, 156, 158, 1);
const Color lightButtonBlue = Color.fromRGBO(237, 248, 255, 1);
const Color calendarLightButtonBlue = Color.fromRGBO(181, 225, 252, 1);
const Color whiteColor = Colors.white;
ThemeData themeData = ThemeData(
  datePickerTheme: const DatePickerThemeData(
    backgroundColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    elevation: 0.0,
  ),
  useMaterial3: true,
);

List<String> jobRoleConstant = [
  "Product Designer",
  "Flutter Developer",
  "QA Tester",
  "Product Owner"
];

Map<int, String> monthMap = {
  1: 'Jan',
  2: 'Feb',
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dec',
};
const String employeeBoxName = "employeedata";
