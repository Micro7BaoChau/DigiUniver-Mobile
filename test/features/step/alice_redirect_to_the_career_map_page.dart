import 'package:dgu/View/career_map_screen.dart';
import 'package:dgu/main.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> aliceRedirectToTheCareerMapPage(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  expect(find.byType(CareerMap), findsOneWidget);
}
