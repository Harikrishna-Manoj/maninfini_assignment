part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

class LoadEmployeeData extends EmployeeEvent {
  // final int offset, limit;

  // LoadEmployeeData({required this.offset, required this.limit});
}

class LoadMoreEmployeeData extends EmployeeEvent {
  final int offset, limit;

  LoadMoreEmployeeData({required this.offset, required this.limit});
}

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
