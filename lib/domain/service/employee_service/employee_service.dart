import 'package:maninfini_task/domain/model/model.dart';

class EmployeeDataOperationService {
  List<EmployeeDataModel> onSorting(int columnIndex, bool ascending,
      List<EmployeeDataModel> employeeDataList) {
    if (columnIndex == 0) {
      ascending
          ? employeeDataList.sort((a, b) => a.name!.compareTo(b.name!))
          : employeeDataList.sort((a, b) => b.name!.compareTo(a.name!));
    } else if (columnIndex == 2) {
      ascending
          ? employeeDataList.sort((a, b) => a.joinDate!.compareTo(b.joinDate!))
          : employeeDataList.sort((a, b) => b.joinDate!.compareTo(a.joinDate!));
    }
    return employeeDataList;
  }
}
