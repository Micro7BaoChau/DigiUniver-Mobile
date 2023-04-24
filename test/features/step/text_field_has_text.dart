import 'package:dgu/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_choose_career.dart';

Future<void> textFieldHasText(WidgetTester tester, String key, String text) async {
  await tester.pumpWidget(WidgetChooseCareer().createWidgetUnderTest());
  expect((tester.widget(find.byKey(Key(key))) as Text).data, text);
}
