part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

final class LoadingState extends EmployeeState {}

// ignore: must_be_immutable
final class LoadedEmployeeState extends EmployeeState {
  final List<EmployeeDataModel> employeeData;
  bool? isSort;
  LoadedEmployeeState({required this.employeeData, this.isSort});
}
