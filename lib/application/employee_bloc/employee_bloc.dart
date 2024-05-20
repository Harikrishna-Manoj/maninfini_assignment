import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/core/model/model.dart';
import 'package:maninfini_task/service/employee_service/employee_service.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
    on<LoadEmployeeData>((event, emit) {
      emit(LoadingState());
      emit(LoadedEmployeeState(employeeData: myData));
    });
    on<SearchingEvent>((event, emit) {
      List<EmployeeDataModel> filterData = myData;
      List<EmployeeDataModel> employeeData = filterData
          .where((element) => element.name!
              .toString()
              .toLowerCase()
              .contains(event.query.toLowerCase()))
          .toList();
      emit(LoadedEmployeeState(employeeData: employeeData));
    });
    bool isSort = false;
    on<SortingEvent>((event, emit) {
      final service = EmployeeDataOperationService();
      isSort = !isSort;
      List<EmployeeDataModel> sortingData =
          service.onSorting(event.columnIndex, event.ascending);
      emit(LoadedEmployeeState(employeeData: sortingData, isSort: isSort));
    });
  }
}
