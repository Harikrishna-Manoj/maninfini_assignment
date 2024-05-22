import 'package:flutter/material.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/presentation/widgets/add_employee.dart';

class ScreenAddEmployee extends StatelessWidget {
  const ScreenAddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    TextEditingController employeeNameController = TextEditingController();
    TextEditingController employeeNumberController = TextEditingController();
    TextEditingController joinDateController = TextEditingController();

    GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
    GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Employee Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, top: 24, left: 16),
          child: Column(
            children: [
              DataTextField(
                formKey: formKey1,
                hintString: "User name",
                textFieldPrefixIcon: const Icon(Icons.person_outline),
                controller: employeeNameController,
                isNumberField: false,
              ),
              const SizedBox(
                height: 23,
              ),
              DataTextField(
                  isNumberField: true,
                  formKey: formKey2,
                  hintString: "Phone number",
                  textFieldPrefixIcon: const Icon(Icons.cases_outlined),
                  controller: employeeNumberController),
              const SizedBox(
                height: 23,
              ),
              DatePickeCalendar(
                joinDateController: joinDateController,
                size: size,
              ),
              const Spacer(),
              const Divider(
                color: dividerGreyColor,
                thickness: 2,
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
              isSaveButton: false,
              formKey1: formKey1,
              formKey2: formKey2,
              text: "Cancel",
              buttonColor: Colors.transparent,
              textColor: Colors.grey),
          const SizedBox(
            width: 16,
          ),
          CustomButton(
              nameController: employeeNameController,
              phoneController: employeeNumberController,
              joinDateController: joinDateController,
              isSaveButton: true,
              formKey1: formKey1,
              formKey2: formKey2,
              text: "Save",
              buttonColor: Colors.black,
              textColor: Colors.white),
        ],
      ),
    );
  }
}
