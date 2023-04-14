import 'package:dgu/View/choose_career_screen.dart';
import 'package:dgu/main.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> aliceIsOnTheChooseCareerPage(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  expect(find.byType(ChooseCareer), findsOneWidget);
}
