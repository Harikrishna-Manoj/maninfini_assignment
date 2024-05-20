part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

class LoadEmployeeData extends EmployeeEvent {}

class SearchingEvent extends EmployeeEvent {
  final String query;

  SearchingEvent({required this.query});
}

class EmployeeAddingEvent extends EmployeeEvent {
  final EmployeeDataModel data;

  EmployeeAddingEvent({required this.data});
}

class SortingEvent extends EmployeeEvent {
  final int columnIndex;
  final bool ascending;

  SortingEvent({required this.columnIndex, required this.ascending});
}
