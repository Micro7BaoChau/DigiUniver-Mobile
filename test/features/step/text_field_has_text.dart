import 'package:dgu/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> textFieldHasText(WidgetTester tester, String key, String text) async {
  await tester.pumpWidget(MyApp());
  expect((tester.widget(find.byKey(Key(key))) as Text).data, text);
}
