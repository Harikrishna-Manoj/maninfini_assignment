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
    List<EmployeeDataModel> employeeModelDataList = [];
    DataManageService dataManageService = DataManageService();
    on<LoadEmployeeData>((event, emit) {
      emit(LoadingState());
      final employeeData = dataManageService.fetchEmployeeData();
      employeeModelDataList.addAll(employeeData);
      emit(LoadedEmployeeState(employeeData: employeeModelDataList));
    });
    on<LoadMoreEmployeeData>((event, emit) {
      final moreEmployeeData =
          dataManageService.fetchMoreEmployeeData(event.offset, event.limit);
      employeeModelDataList.addAll(moreEmployeeData);
      emit(LoadedEmployeeState(
          employeeData: employeeModelDataList,
          moreDataLength: moreEmployeeData.length));
    });
    on<EmployeeAddingEvent>((event, emit) async {
      await dataManageService.addEmployeeToDatabase(data: event.data);
      add(LoadEmployeeData());
    });

    on<SearchingEvent>((event, emit) {
      List<EmployeeDataModel> filterData = employeeModelDataList
          .where((element) => element.name!
              .toString()
              .toLowerCase()
              .contains(event.query.toLowerCase()))
          .toList();
      emit(LoadedEmployeeState(employeeData: filterData));
    });

    on<SortingEvent>((event, emit) {
      final service = EmployeeDataOperationService();
      if (employeeModelDataList.isNotEmpty) {
        List<EmployeeDataModel> sortingData = service.onSorting(
            event.columnIndex, event.ascending, employeeModelDataList);
        emit(LoadedEmployeeState(employeeData: sortingData));
      }
    });
  }
}
