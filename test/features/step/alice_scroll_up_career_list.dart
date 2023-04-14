import 'package:dgu/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> aliceScrollUpCareerList(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.drag(find.byType(ListTile).first,const Offset(0,500));
  await tester.pump();
}
