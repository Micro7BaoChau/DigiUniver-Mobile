import 'package:flutter_test/flutter_test.dart';

Future<void> aliceWaiting(WidgetTester tester) async {
  await tester.pump(Duration(milliseconds: 500));
}
