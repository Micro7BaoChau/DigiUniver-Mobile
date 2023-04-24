import 'package:dgu/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_choose_career.dart';

Future<void> aliceClick(WidgetTester tester, String text) async {
  await tester.pumpWidget(WidgetChooseCareer().createWidgetUnderTest());
  final widget=find.byKey(Key(text));
  await tester.tap(widget,warnIfMissed: false);
  await tester.pump();
}
