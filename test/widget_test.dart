// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:natalia_task/data/constants.dart';

import 'package:natalia_task/main.dart';
import 'package:natalia_task/screens/main_page.dart';

void main() async {



  testWidgets('Main Page', (WidgetTester tester) async {

    tester.binding.window.physicalSizeTestValue = Size(400, 1900);

    // Build our app and trigger a frame.
    await tester.pumpWidget(ScreenUtilInit(
      builder: () => MaterialApp(
        home: ExplorerHome(),
      ),
    ));


    await tester.pumpAndSettle();



    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

  });
}
