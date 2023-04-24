import 'package:dgu/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_choose_career.dart';

Future<void> groupIsAppear(WidgetTester tester, String text) async {
  await tester.pumpWidget(WidgetChooseCareer().createWidgetUnderTest());
  expect(find.byKey(Key(text)), findsOneWidget);
}
