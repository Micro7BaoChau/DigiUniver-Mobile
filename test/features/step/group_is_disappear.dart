import 'package:dgu/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> groupIsDisappear(WidgetTester tester, String text) async {
  await tester.pumpWidget(MyApp());
  expect(find.byKey(Key(text)), findsNothing);
}
