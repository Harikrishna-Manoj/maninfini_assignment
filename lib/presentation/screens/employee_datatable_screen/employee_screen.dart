import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/core/debounce/debounce.dart';
import 'package:maninfini_task/core/model/model.dart';
import 'package:maninfini_task/presentation/widgets/widgets.dart';

// ignore: must_be_immutable
class EmployeeDataScreen extends StatelessWidget {
  EmployeeDataScreen({super.key});

  final debouncer = Debouncer(milliseconds: 500);

  TextEditingController controller = TextEditingController();

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
                      ? PaginatedDataTable(
                          showEmptyRows: false,
                          sortColumnIndex: 0,
                          sortAscending: state.isSort ?? true,
                          header:
                              CustomSearchField(searchController: controller),
                          source: RowSource(
                            myData: state.employeeData,
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
                                  context.read<EmployeeBloc>().add(SortingEvent(
                                      columnIndex: columnIndex,
                                      ascending: ascending));
                                }),
                            const DataColumn(
                              label: Text(
                                "Phone",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ),
                            const DataColumn(
                              label: Text(
                                "Date of Join",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text("No data"),
                        );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RowSource extends DataTableSource {
  final List<Data>? myData;
  final int count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data) {
  return DataRow(
    cells: [
      DataCell(Text(data.name ?? "Name")),
      DataCell(Text(data.phone.toString())),
      DataCell(Text(data.joinDate.toString())),
    ],
  );
}
