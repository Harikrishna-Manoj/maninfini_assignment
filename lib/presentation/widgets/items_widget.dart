import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/domain/service/data_manage_service/data_manage_service.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({
    super.key,
    required this.state,
  });
  final LoadedEmployeeState state;

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  final ScrollController controller = ScrollController();
  DataManageService dataManageService = DataManageService();
  bool hasMore = true;
  int offset = 15;
  int limit = 15;

  @override
  void initState() {
    super.initState();
    controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (controller.position.maxScrollExtent == controller.offset) {
      final moreEmployeeData =
          dataManageService.fetchMoreEmployeeData(offset, limit);
      context
          .read<EmployeeBloc>()
          .add(LoadMoreEmployeeData(offset: offset, limit: limit));
      setState(() {
        offset += limit;
        if (moreEmployeeData.length < limit) {
          hasMore = false;
        }
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ListView.separated(
      controller: controller,
      itemBuilder: (context, index) {
        return index < widget.state.employeeData.length
            ? SizedBox(
                height: 30,
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.state.employeeData[index].name!,
                      ),
                      Text(widget.state.employeeData[index].phone!),
                      Text(DateFormat("dd LLL yyyy")
                          .format(widget.state.employeeData[index].joinDate!)),
                    ],
                  ),
                ),
              )
            : Center(
                child: hasMore
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      )
                    : const Text("No more data"),
              );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: widget.state.employeeData.length + 1,
    );
  }
}
