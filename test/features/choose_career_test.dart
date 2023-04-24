// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/alice_is_on_the_choose_career_page.dart';
import './step/alice_waiting.dart';
import './step/alice_see.dart';
import './step/item_has_gray_color.dart';
import './step/alice_click_item.dart';
import './step/item_has_green_color.dart';
import './step/text_field_has_text.dart';
import './step/the_checkbox_is_checked.dart';
import './step/alice_click.dart';
import './step/the_checkbox_is_unchecked.dart';
import './step/group_is_disappear.dart';
import './step/group_is_appear.dart';
import './step/alice_scroll_down_career_list.dart';
import './step/alice_scroll_up_career_list.dart';
import './step/alice_redirect_to_the_career_map_page.dart';

void main() {
  group('''Career''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await aliceIsOnTheChooseCareerPage(tester);
    }
    testWidgets('''Loading first contents for Choosing Career page''', (tester) async {
      await bddSetUp(tester);
      await aliceWaiting(tester);
      await aliceSee(tester, 'txt-title');
      await aliceSee(tester, 'lv-list_career');
    });
    testWidgets('''Know which Career is currently selected''', (tester) async {
      await bddSetUp(tester);
      await itemHasGrayColor(tester, 'Technology');
      await aliceClickItem(tester, 'Technology');
      await itemHasGreenColor(tester, 'Technology');
    });
    testWidgets('''Change title when choosing career''', (tester) async {
      await bddSetUp(tester);
      await textFieldHasText(tester, 'txt-title', 'Please chose your career');
      await aliceClickItem(tester, 'Technology');
      await textFieldHasText(tester, 'txt-title', 'You are choosing');
    });
    testWidgets('''Change selected Career''', (tester) async {
      await bddSetUp(tester);
      await aliceClickItem(tester, 'Technology');
      await itemHasGreenColor(tester, 'Technology');
      await itemHasGrayColor(tester, 'Life Style');
      await aliceClickItem(tester, 'Life Style');
      await itemHasGrayColor(tester, 'Technology');
      await itemHasGreenColor(tester, 'Life Style');
    });
    testWidgets('''Change display mode for next time visit''', (tester) async {
      await bddSetUp(tester);
      await aliceClickItem(tester, 'Technology');
      await theCheckboxIsChecked(tester, 'cb-display_again');
      await aliceClick(tester, 'grp-display_again');
      await theCheckboxIsUnchecked(tester, 'cb-display_again');
      await aliceClick(tester, 'grp-display_again');
      await theCheckboxIsChecked(tester, 'cb-display_again');
    });
    testWidgets('''Show button and checkbox''', (tester) async {
      await bddSetUp(tester);
      await groupIsDisappear(tester, 'grp-checkbox_button');
      await aliceClickItem(tester, 'Technology');
      await groupIsAppear(tester, 'grp-checkbox_button');
    });
    testWidgets('''UnShow/Show button and checkbox when scroll down/up''', (tester) async {
      await bddSetUp(tester);
      await aliceClickItem(tester, 'Technology');
      await aliceScrollDownCareerList(tester);
      await groupIsDisappear(tester, 'grp-checkbox_button');
      await aliceScrollUpCareerList(tester);
      await groupIsAppear(tester, 'grp-checkbox_button');
    });
    testWidgets('''Redirect to another page''', (tester) async {
      await bddSetUp(tester);
      await aliceClickItem(tester, 'Technology');
      await groupIsAppear(tester, 'grp-checkbox_button');
      await aliceClick(tester, 'btn-confirm_career');
      await aliceRedirectToTheCareerMapPage(tester);
    });
  });
}
