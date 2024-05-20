// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:maninfini_task/core/constant/constant.dart';

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
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        );
        if (pickedDate != null) {
          joinDateController.text =
              DateFormat('dd LLL yyyy').format(pickedDate);
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
            //   if (formKey1!.currentState!.validate() &&
            //       formKey2!.currentState!.validate()) {
            //     EmployeeModelData data = EmployeeModelData(
            //         employeeName: nameController?.text.trim() ?? "",
            //         role: roleController?.text.trim() ?? "",
            //         joinDate: joinDateController?.text.trim() == ""
            //             ? DateFormat('d LLL yyyy').format(DateTime.now())
            //             : joinDateController?.text.trim(),
            //         resignDate: resignDateController?.text.trim() == ""
            //             ? "No date"
            //             : resignDateController?.text.trim());
            //     context
            //         .read<AddEmployeeBloc>()
            //         .add(AddEmployeeEvent.addEmployee(data));
            //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content: Text(
            //           "Added",
            //           style: TextStyle(color: blueColor),
            //         ),
            //         dismissDirection: DismissDirection.down,
            //         backgroundColor: lightButtonBlue));
            //     Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const ScreenHome(),
            //         ));
            //     context
            //         .read<EmployeeListHomeBloc>()
            //         .add(const FetchEmployeesEvent());
            //   }
            // } else {
            //   Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const ScreenHome(),
            //       ));
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
