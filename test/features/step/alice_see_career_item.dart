import 'package:dgu/main.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> aliceSeeCareerItem(WidgetTester tester, String text) async {
  await tester.pumpWidget(MyApp());
  expect(find.text(text), findsOneWidget);
}
