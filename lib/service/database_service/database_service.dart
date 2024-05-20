import 'package:hive_flutter/adapters.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/core/model/model.dart';

class DatabaseService {
  static openDataBase() async {
    await Hive.openBox<EmployeeDataModel>(employeeBoxName);
  }
}
