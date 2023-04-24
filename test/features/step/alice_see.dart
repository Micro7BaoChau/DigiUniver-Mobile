import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_choose_career.dart';



Future<void> aliceSee(WidgetTester tester,  String text) async {
    await tester.pumpWidget(WidgetChooseCareer().createWidgetUnderTest());
    expect(find.byKey(Key(text)), findsOneWidget);

}
