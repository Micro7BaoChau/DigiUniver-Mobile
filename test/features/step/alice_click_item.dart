import 'package:dgu/main.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> aliceClickItem(WidgetTester tester, String text) async {
  await tester.pumpWidget(const MyApp());
  final item=find.text(text);
  await tester.tap(item,warnIfMissed: false);
  await tester.pump();
}
