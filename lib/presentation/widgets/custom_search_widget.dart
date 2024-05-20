import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/core/debounce/debounce.dart';

import '../../application/employee_bloc/employee_bloc.dart';

class CustomSearchField extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CustomSearchField({
    required this.searchController,
  });
  final TextEditingController searchController;
  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Material(
        child: TextFormField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: Colors.black),
          controller: widget.searchController,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 35, left: 15),
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: 'Enter for filter',
              hintStyle:
                  TextStyle(fontSize: 15, height: 1.5, color: Colors.black)),
          onChanged: (value) {
            debouncer.run(() {
              context.read<EmployeeBloc>().add(SearchingEvent(query: value));
            });
          },
        ),
      ),
    );
  }
}
