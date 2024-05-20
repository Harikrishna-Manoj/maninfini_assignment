import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/core/model/model.dart';
import 'package:maninfini_task/service/data_manage_service/data_manage_service.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'add_employee_data_event.dart';
part 'add_employee_data_state.dart';

class AddEmployeeDataBloc
    extends Bloc<AddEmployeeDataEvent, AddEmployeeDataState> {
  AddEmployeeDataBloc() : super(AddEmployeeDataInitial()) {
    on<EmployeeAddingEvent>((event, emit) async {
      DataManageService dataManageService = DataManageService();
      await dataManageService.addEmployeeToDatabase(data: event.data);
    });
  }
}
