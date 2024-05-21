import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/domain/model/model.dart';
import 'package:maninfini_task/domain/service/data_manage_service/data_manage_service.dart';
import 'package:maninfini_task/domain/service/employee_service/employee_service.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
    on<LoadEmployeeData>((event, emit) {
      emit(LoadingState());
      final employeeData = DataManageService().fetchEmployeeData();
      emit(LoadedEmployeeState(employeeData: employeeData));
    });

    on<EmployeeAddingEvent>((event, emit) async {
      DataManageService dataManageService = DataManageService();
      await dataManageService.addEmployeeToDatabase(data: event.data);
      add(LoadEmployeeData());
    });

    on<SearchingEvent>((event, emit) {
      List<EmployeeDataModel> filterData =
          DataManageService().fetchEmployeeData();
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
