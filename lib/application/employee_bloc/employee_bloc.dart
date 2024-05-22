import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:maninfini_task/core/constant/constant.dart';

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
      employeeModelDataList = [...employeeData];
      emit(LoadedEmployeeState(employeeData: employeeModelDataList));
    });
    on<LoadMoreEmployeeData>((event, emit) {
      final moreEmployeeData =
          dataManageService.fetchMoreEmployeeData(event.offset, event.limit);
      employeeModelDataList.addAll(moreEmployeeData);
      emit(LoadedEmployeeState(
        employeeData: employeeModelDataList,
      ));
    });
    on<EmployeeAddingEvent>((event, emit) async {
      await dataManageService.addEmployeeToDatabase(data: event.data);
      employeeModelDataList.add(event.data);
      emit(LoadedEmployeeState(employeeData: employeeModelDataList));
    });

    on<SearchingEvent>((event, emit) {
      List<dynamic> filterData =
          Hive.box<EmployeeDataModel>(employeeBoxName).values.where((employee) {
        final nameLower = employee.name!.toLowerCase();
        final searchLower = event.query.toLowerCase();
        return nameLower.contains(searchLower);
      }).toList();
      if (event.query == "") {
        filterData.clear();
      }
      emit(LoadedSearchEmployeeState(searchEmployeeData: filterData));
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
