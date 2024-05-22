import 'package:hive_flutter/adapters.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/domain/model/model.dart';

class DatabaseService {
  static openDataBase() async {
    final database = await Hive.openBox<EmployeeDataModel>(employeeBoxName);
    if (database.isEmpty) {
      for (var i = 0; i < employees.length; i++) {
        database.add(employees[i]);
      }
    }
  }
}
