import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/core/debounce/debounce.dart';
import 'package:maninfini_task/core/model/model.dart';

class EmployeeDataScreen extends StatefulWidget {
  const EmployeeDataScreen({super.key});

  @override
  State<EmployeeDataScreen> createState() => _EmployeeDataScreen();
}

class _EmployeeDataScreen extends State<EmployeeDataScreen> {
  bool sort = true;
  List<Data>? filterData;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    filterData = myData;
    super.initState();
  }

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
                          sortAscending: sort,
                          header: SizedBox(
                            height: 50,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(color: Colors.black),
                              controller: controller,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(bottom: 35, left: 15),
                                  prefixIcon: Icon(Icons.search),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: 'Enter for filter',
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      height: 1.5,
                                      color: Colors.grey)),
                              onChanged: (value) {
                                debouncer.run(() {
                                  context
                                      .read<EmployeeBloc>()
                                      .add(SearchingEvent(query: value));
                                });
                              },
                            ),
                          ),
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
                                  setState(() {
                                    sort = !sort;
                                  });
                                  // onsortColum(columnIndex, ascending);
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
