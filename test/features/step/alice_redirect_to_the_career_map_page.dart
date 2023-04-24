import 'package:dgu/main.dart';
import 'package:dgu/views/career_map_page/career_map_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_choose_career.dart';

Future<void> aliceRedirectToTheCareerMapPage(WidgetTester tester) async {
  await tester.pumpWidget(WidgetChooseCareer().createWidgetUnderTest());
  expect(find.byType(CareerMap), findsOneWidget);
}
