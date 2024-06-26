// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/domain/model/model.dart';
import 'package:maninfini_task/main.dart';

class DataTextField extends StatelessWidget {
  const DataTextField({
    super.key,
    required this.hintString,
    required this.textFieldPrefixIcon,
    required this.controller,
    required this.formKey,
    required this.isNumberField,
  });
  final String hintString;
  final bool isNumberField;
  final Icon textFieldPrefixIcon;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        keyboardType: isNumberField ? TextInputType.phone : TextInputType.name,
        inputFormatters: isNumberField
            ? []
            : [
                FilteringTextInputFormatter.allow(RegExp("[a-z A-Z.]")),
              ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field should not be empty";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          prefixIcon: textFieldPrefixIcon,
          hintText: hintString,
          hintStyle: const TextStyle(fontSize: 16, color: detailsTextGreyColor),
          contentPadding: const EdgeInsets.all(8),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: detailsTextGreyColor)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: detailsTextGreyColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    );
  }
}

class DatePickeCalendar extends StatelessWidget {
  const DatePickeCalendar({
    super.key,
    required this.size,
    required this.joinDateController,
  });

  final Size size;
  final TextEditingController joinDateController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: joinDateController,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          builder: (context, child) {
            return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    onSurface: Colors.black,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
                child: child!);
          },
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        );
        if (pickedDate != null) {
          joinDateController.text =
              DateFormat("yyyy-MM-dd").format(pickedDate).toString();
        }
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.calendar_today_outlined,
        ),
        hintText: "Today",
        hintStyle: TextStyle(fontSize: 14, color: Colors.black),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: detailsTextGreyColor)),
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: detailsTextGreyColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    this.formKey1,
    this.formKey2,
    required this.isSaveButton,
    this.nameController,
    this.phoneController,
    this.joinDateController,
  });
  final String text;
  final Color buttonColor;
  final Color textColor;
  final GlobalKey<FormState>? formKey1;
  final GlobalKey<FormState>? formKey2;
  final bool isSaveButton;

  final TextEditingController? nameController;
  final TextEditingController? phoneController;
  final TextEditingController? joinDateController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 73,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: () {
          if (isSaveButton) {
            if (formKey1!.currentState!.validate() &&
                formKey2!.currentState!.validate()) {
              EmployeeDataModel data = EmployeeDataModel(
                name: nameController?.text.trim() ?? "",
                phone: phoneController?.text.trim() ?? "",
                joinDate: joinDateController?.text.trim() == ""
                    ? DateTime.now()
                    : DateTime.parse(
                        joinDateController?.text ?? DateTime.now().toString()),
              );
              context.read<EmployeeBloc>().add(EmployeeAddingEvent(data: data));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Added",
                    style: TextStyle(color: whiteColor),
                  ),
                  dismissDirection: DismissDirection.down,
                  backgroundColor: Colors.black));
              navigatorKey.currentState!.pop();
            }
          } else {
            navigatorKey.currentState!.pop();
          }
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
