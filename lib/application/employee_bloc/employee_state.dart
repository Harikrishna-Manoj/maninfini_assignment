part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

final class LoadingState extends EmployeeState {}

final class LoadedEmployeeState extends EmployeeState {
  final List<Data> employeeData;

  LoadedEmployeeState({required this.employeeData});
}
