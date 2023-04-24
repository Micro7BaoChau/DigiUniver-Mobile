import 'package:dgu/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_choose_career.dart';

Future<void> itemHasGrayColor(WidgetTester tester, String text) async {
  await tester.pumpWidget(WidgetChooseCareer().createWidgetUnderTest());
  final item=find.byKey(Key(text));
  await tester.pump(const Duration(seconds: 20));
  expect((tester.widget(item) as TextButton).style?.backgroundColor?.resolve({}),Colors.black12);
}
