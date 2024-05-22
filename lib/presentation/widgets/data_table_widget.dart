import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maninfini_task/domain/model/model.dart';

class RowSource {
  final List<EmployeeDataModel>? employeeData;
  final int count;
  RowSource({
    required this.employeeData,
    required this.count,
  });

  List<DataRow> getRow() {
    List<DataRow> listOfDataRow = [];
    if (count > 0) {
      for (var i = 0; i < count; i++) {
        listOfDataRow.add(recentFileDataRow(employeeData![i]));
      }
      return listOfDataRow;
    } else {
      return [];
    }
  }
}

DataRow recentFileDataRow(var data) {
  return DataRow(
    cells: [
      DataCell(Text(data.name ?? "Name")),
      DataCell(Text(data.phone.toString())),
      DataCell(Text(DateFormat("dd LLL yyyy").format(data.joinDate))),
    ],
  );
}
