import 'package:maninfini_task/core/model/model.dart';

class EmployeeDataService {
  List<Data> onSorting(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        myData.sort((a, b) => a.name!.compareTo(b.name!));
      } else {
        myData.sort((a, b) => b.name!.compareTo(a.name!));
      }
    }
    return myData;
  }
}
