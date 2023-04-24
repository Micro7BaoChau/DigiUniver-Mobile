import 'package:dgu/main.dart';
import 'package:dgu/views/choose_career_page/choose_career_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_choose_career.dart';

Future<void> aliceIsOnTheChooseCareerPage(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  expect(find.byType(ChooseCareer), findsOneWidget);
}
