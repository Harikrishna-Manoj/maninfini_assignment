import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/core/debounce/debounce.dart';
import 'package:maninfini_task/main.dart';
import 'package:maninfini_task/presentation/screens/page_add_employee/screen_add_employee.dart';
import 'package:maninfini_task/presentation/widgets/custom_search_widget.dart';
import 'package:maninfini_task/presentation/widgets/data_table_widget.dart';

// ignore: must_be_immutable
class EmployeeDataScreen extends StatelessWidget {
  EmployeeDataScreen({super.key});

  final debouncer = Debouncer(milliseconds: 500);
  TextEditingController controller = TextEditingController();
  int? index;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<EmployeeBloc>(context).add(LoadEmployeeData());
    });
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Employee Data"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.035,
            ),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  return state is LoadedEmployeeState
                      ? state.employeeData.isNotEmpty
                          ? PaginatedDataTable(
                              showEmptyRows: false,
                              sortColumnIndex: index,
                              sortAscending: state.isSort ?? false,
                              header: CustomSearchField(
                                  searchController: controller),
                              source: RowSource(
                                employeeData: state.employeeData,
                                count: state.employeeData.length,
                              ),
                              rowsPerPage: 8,
                              columns: [
                                DataColumn(
                                    label: const Text(
                                      "Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                    onSort: (columnIndex, ascending) {
                                      index = columnIndex;
                                      context.read<EmployeeBloc>().add(
                                          SortingEvent(
                                              columnIndex: columnIndex,
                                              ascending: ascending));
                                    }),
                                const DataColumn(
                                  label: Text(
                                    "Phone",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                                DataColumn(
                                  label: const Text(
                                    "Date of Join",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  onSort: (columnIndex, ascending) {
                                    index = columnIndex;
                                    context.read<EmployeeBloc>().add(
                                        SortingEvent(
                                            columnIndex: columnIndex,
                                            ascending: ascending));
                                  },
                                ),
                              ],
                            )
                          : const Center(
                              child: Text("No data"),
                            )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 2,
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          navigatorKey.currentState!.push(MaterialPageRoute(
            builder: (context) => const ScreenAddEmployee(),
          ));
        },
        child: const Icon(Icons.add, color: whiteColor),
      ),
    );
  }
}
