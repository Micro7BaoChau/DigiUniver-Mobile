import 'package:dgu/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> theCheckboxIsChecked(WidgetTester tester, String key) async {
  await tester.pumpWidget(MyApp());
  expect((tester.widget(find.byType(Checkbox)) as Checkbox).value,true);
}
