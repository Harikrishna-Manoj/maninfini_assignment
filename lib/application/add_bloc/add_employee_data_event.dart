part of 'add_employee_data_bloc.dart';

@immutable
sealed class AddEmployeeDataEvent {}

class EmployeeAddingEvent extends AddEmployeeDataEvent {
  final EmployeeDataModel data;

  EmployeeAddingEvent({required this.data});
}
