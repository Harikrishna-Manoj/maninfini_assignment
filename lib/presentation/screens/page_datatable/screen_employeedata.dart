import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/core/debounce/debounce.dart';

import 'package:maninfini_task/main.dart';
import 'package:maninfini_task/presentation/screens/page_add_employee/screen_add_employee.dart';
import 'package:maninfini_task/presentation/widgets/cloumn_heading.dart';
import 'package:maninfini_task/presentation/widgets/custom_search_widget.dart';
import 'package:maninfini_task/presentation/widgets/items_widget.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                tag: "searchfield",
                child: CustomSearchField(
                    searchController: controller, isNotSearchField: true),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const CloumnHeading(),
              SizedBox(
                height: size.height * 0.02,
              ),
              BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  return state is LoadedEmployeeState
                      ? state.employeeData.isNotEmpty
                          ? Expanded(child: ItemsWidget(state: state))
                          : Flexible(
                              child: SizedBox(
                                  width: size.width,
                                  height: size.height * 0.6,
                                  child: const Center(child: Text("No data"))),
                            )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 2,
                          ),
                        );
                },
              ),
            ],
          ),
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
