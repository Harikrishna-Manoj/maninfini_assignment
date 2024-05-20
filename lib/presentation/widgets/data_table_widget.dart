import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maninfini_task/core/model/model.dart';

class RowSource extends DataTableSource {
  final List<EmployeeDataModel>? employeeData;
  final int count;
  RowSource({
    required this.employeeData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(employeeData![index]);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
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
