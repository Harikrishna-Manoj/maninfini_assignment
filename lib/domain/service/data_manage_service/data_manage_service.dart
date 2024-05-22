import 'package:hive_flutter/adapters.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/domain/model/model.dart';

class DataManageService {
  Future<void> addEmployeeToDatabase({required EmployeeDataModel data}) async {
    final hiveBox = Hive.box<EmployeeDataModel>(employeeBoxName);
    await hiveBox.add(data);
  }

  List<EmployeeDataModel> fetchEmployeeData() {
    int limit = 15;
    final hiveBox = Hive.box<EmployeeDataModel>(employeeBoxName);
    List<EmployeeDataModel> employeeData = hiveBox.values.take(limit).toList();
    return employeeData;
  }

  List<EmployeeDataModel> fetchMoreEmployeeData(int offset, int limit) {
    final hiveBox = Hive.box<EmployeeDataModel>(employeeBoxName);

    List<EmployeeDataModel> employeeData =
        hiveBox.values.toList().skip(offset).take(limit).toList();
    // print(employeeData.length);

    return employeeData;
  }
}
