import 'package:dgu/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> itemHasGreenColor(WidgetTester tester, String text) async {
  await tester.pumpWidget(const MyApp());
  final item=find.byKey(Key(text));
  await tester.ensureVisible(item);
  expect((tester.widget(item) as TextButton).style?.backgroundColor?.resolve({}),Colors.green);
}
