import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/presentation/screens/employee_datatable_screen/employee_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EmployeeBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Employee Data',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            cardTheme: const CardTheme(
              elevation: 0.0,
            ),
            useMaterial3: true,
          ),
          home: EmployeeDataScreen(),
        ));
  }
}
