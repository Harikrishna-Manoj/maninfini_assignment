import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';

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
      context
          .read<EmployeeBloc>()
          .add(LoadMoreEmployeeData(offset: offset, limit: limit));
      setState(() {
        offset += limit;
        if (widget.state.moreDataLength! < limit) {
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
