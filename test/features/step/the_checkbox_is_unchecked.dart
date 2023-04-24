import 'package:dgu/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_choose_career.dart';

Future<void> theCheckboxIsUnchecked(WidgetTester tester, String key) async {
  await tester.pumpWidget(WidgetChooseCareer().createWidgetUnderTest());
  expect((tester.widget(find.byType(Checkbox)) as Checkbox).value,false);
}
