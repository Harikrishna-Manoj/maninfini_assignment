import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:maninfini_task/application/add_bloc/add_employee_data_bloc.dart';
import 'package:maninfini_task/application/employee_bloc/employee_bloc.dart';
import 'package:maninfini_task/core/constant/constant.dart';
import 'package:maninfini_task/core/model/model.dart';
import 'package:maninfini_task/presentation/screens/page_datatable/screen_employeedata.dart';
import 'package:maninfini_task/service/database_service/database_service.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dataPath = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dataPath.path);
  Hive.registerAdapter<EmployeeDataModel>(EmployeeDataModelAdapter());
  await DatabaseService.openDataBase();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EmployeeBloc(),
          ),
          BlocProvider(
            create: (context) => AddEmployeeDataBloc(),
          ),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Employee Data',
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: EmployeeDataScreen(),
        ));
  }
}
