import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/core/debounce/debounce.dart';
import 'package:maninfini_task/domain/model/model.dart';
import 'package:maninfini_task/domain/service/data_manage_service/data_manage_service.dart';
import 'package:maninfini_task/main.dart';
import 'package:maninfini_task/presentation/screens/page_add_employee/screen_add_employee.dart';
import 'package:maninfini_task/presentation/widgets/custom_search_widget.dart';

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
              CustomSearchField(searchController: controller),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name"),
                  Text("Phone"),
                  Text("Join date"),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  return state is LoadedEmployeeState
                      ? state.employeeData.isNotEmpty
                          ? Expanded(child: ItemsWidget(state: state))
                          : SizedBox(
                              width: size.width,
                              height: size.height * 0.6,
                              child: const Center(child: Text("No data")))
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
      List<EmployeeDataModel> moreData =
          DataManageService().fetchMoreEmployeeData(offset, limit);

      setState(() {
        widget.state.employeeData.addAll(moreData);
        offset += limit;
        if (moreData.length < limit) {
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
    return ListView.separated(
      controller: controller,
      itemBuilder: (context, index) {
        return index < widget.state.employeeData.length
            ? SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.state.employeeData[index].name!),
                    Text(widget.state.employeeData[index].phone!),
                    Text(DateFormat("dd LLL yyyy")
                        .format(widget.state.employeeData[index].joinDate!)),
                  ],
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

class HomePagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.lineTo(0, size.height * 0.09);
    path.quadraticBezierTo(
        0, size.height * 0.15, size.width * .15, size.height * 0.15);
    // path.lineTo(size.width * 0.4, size.height * 0.4);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
