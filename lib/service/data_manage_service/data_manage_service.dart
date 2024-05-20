import 'package:hive_flutter/adapters.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/core/model/model.dart';

class DataManageService {
  Future<void> addEmployeeToDatabase({required EmployeeDataModel data}) async {
    final hiveBox = Hive.box<EmployeeDataModel>(employeeBoxName);
    await hiveBox.add(data);
  }
}
