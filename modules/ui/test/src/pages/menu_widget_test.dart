import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/commons/navigator_wrapper.dart';
import 'package:ui/src/pages/menu_widget.dart';

import '../../utils/utils.dart';

void main() {

  group("The user in Start Page", () {
  
    testWidgets('should see hello message', (WidgetTester tester) async {
      var navigatorWrapper = NavigatorWrapper.createNull();
      await tester.pumpWidget(buildWidget(MenuWidget(navigatorWrapper)));

      var helloWorldElementFinder = find.byWidgetPredicate((widget) => widget.key == const Key("menu"));
      var helloWorldText = getSingleAs<Text>(helloWorldElementFinder);
      expect(helloWorldText.data, "Menu");
    });

    testWidgets('should contain a btn to Ingredients Page', (WidgetTester tester) async {
      var navigatorWrapper = NavigatorWrapper.createNull(routes: ["/ingredients"]);
      await tester.pumpWidget(buildWidget(MenuWidget(navigatorWrapper)));

      var toIngredientsPageBtn = find.byWidgetPredicate((widget) => widget.key !=null && widget.key == const Key("toIngredientsPageBtn"));
      await tester.tap(toIngredientsPageBtn);

      String currentPage = navigatorWrapper.currentLocation;
      expect(currentPage, equals("/ingredients"));
    });
  });
}
