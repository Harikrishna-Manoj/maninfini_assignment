// ignore_for_file: must_be_immutable

part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

final class LoadingState extends EmployeeState {}

final class LoadedEmployeeState extends EmployeeState {
  final List<EmployeeDataModel> employeeData;
  bool? isSort;
  LoadedEmployeeState({required this.employeeData, this.isSort});
}
