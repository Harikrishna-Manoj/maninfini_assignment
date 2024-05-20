import 'package:hive_flutter/adapters.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/core/model/model.dart';

class EmployeeDataOperationService {
  List<EmployeeDataModel> onSorting(int columnIndex, bool ascending) {
    final hiveBox = Hive.box<EmployeeDataModel>(employeeBoxName);
    List<EmployeeDataModel> employeeData = [...hiveBox.values];
    if (columnIndex == 0) {
      ascending
          ? employeeData.sort((a, b) => a.name!.compareTo(b.name!))
          : employeeData.sort((a, b) => b.name!.compareTo(a.name!));
    } else if (columnIndex == 2) {
      ascending
          ? employeeData.sort((a, b) => a.joinDate!.compareTo(b.joinDate!))
          : employeeData.sort((a, b) => b.joinDate!.compareTo(a.joinDate!));
    }
    return employeeData;
  }
}
