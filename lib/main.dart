import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natalia_task/screens/home_page/home_page.dart';
import 'package:natalia_task/screens/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(400, 800),
      builder: () =>  MaterialApp(
        title: 'Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ExplorerHome()
      ),
    );
  }
}

