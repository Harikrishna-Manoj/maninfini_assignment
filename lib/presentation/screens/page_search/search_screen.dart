import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/main.dart';
import 'package:maninfini_task/presentation/widgets/custom_search_widget.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => navigatorKey.currentState!.pop(),
                      icon: const Icon(Icons.keyboard_arrow_left)),
                  Expanded(
                    child: Hero(
                      tag: "searchfield",
                      child: CustomSearchField(
                        searchController: controller,
                        isNotSearchField: false,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .02,
              ),
              BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  return state is LoadedSearchEmployeeState
                      ? state.searchEmployeeData.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                              itemCount: state.searchEmployeeData.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 30,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.08),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.searchEmployeeData[index].name!,
                                        ),
                                        Text(state
                                            .searchEmployeeData[index].phone!),
                                        Text(DateFormat("dd LLL yyyy").format(
                                            state.searchEmployeeData[index]
                                                .joinDate!)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ))
                          : Flexible(
                              child: SizedBox(
                                  width: size.width,
                                  height: size.height * 0.6,
                                  child: const Center(child: Text("No data"))),
                            )
                      : Flexible(
                          child: SizedBox(
                              width: size.width,
                              height: size.height * 0.6,
                              child:
                                  const Center(child: Text("Search for user"))),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
