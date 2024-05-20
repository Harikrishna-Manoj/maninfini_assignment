import 'package:maninfini_task/core/model/model.dart';

class EmployeeDataService {
  List<Data> onSorting(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      ascending
          ? myData.sort((a, b) => a.name!.compareTo(b.name!))
          : myData.sort((a, b) => b.name!.compareTo(a.name!));
    } else if (columnIndex == 2) {
      ascending
          ? myData.sort((a, b) => a.joinDate!.compareTo(b.joinDate!))
          : myData.sort((a, b) => b.joinDate!.compareTo(a.joinDate!));
    }
    return myData;
  }
}
