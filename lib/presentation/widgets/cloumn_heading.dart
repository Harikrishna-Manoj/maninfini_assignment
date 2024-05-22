import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';

class CloumnHeading extends StatelessWidget {
  const CloumnHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> nameValueNotifier = ValueNotifier(false);
    ValueNotifier<bool> joinDateValueNotifier = ValueNotifier(false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () {
            nameValueNotifier.value = !nameValueNotifier.value;
            context.read<EmployeeBloc>().add(SortingEvent(
                columnIndex: 0, ascending: nameValueNotifier.value));
          },
          icon: ValueListenableBuilder(
            valueListenable: nameValueNotifier,
            builder: (context, value, child) {
              return Icon(
                nameValueNotifier.value
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                color: Colors.black,
              );
            },
          ),
          label: const Text(
            "Name",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Phone",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton.icon(
            onPressed: () {
              joinDateValueNotifier.value = !joinDateValueNotifier.value;
              context.read<EmployeeBloc>().add(SortingEvent(
                  columnIndex: 2, ascending: joinDateValueNotifier.value));
            },
            icon: ValueListenableBuilder(
              valueListenable: joinDateValueNotifier,
              builder: (context, value, child) {
                return Icon(
                  joinDateValueNotifier.value
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                  color: Colors.black,
                );
              },
            ),
            label: const Text(
              "Join date",
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}
