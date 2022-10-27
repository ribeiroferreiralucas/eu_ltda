import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/menu_widget.dart';
import 'package:ui/src/start_page.dart';

void main() {

  group("The user in Start Page", () {
    testWidgets('should see hello message', (WidgetTester tester) async {
      
      await tester.pumpWidget(StartPage.createTestInstance());

      var helloWorldElementFinder = find.byWidgetPredicate((widget) => widget.key == const Key("hello_world"));
      var helloWorldText = getSingleAs<Text>(helloWorldElementFinder);
      expect(helloWorldText.data, "Hello World");
    });

    testWidgets('should contains menu', (WidgetTester tester) async {
      
      await tester.pumpWidget(StartPage.createTestInstance());

      var menuWidget = find.byWidgetPredicate((widget) => widget is MenuWidget);
      expect(menuWidget, findsOneWidget);
    });

  });
}



T getSingleAs<T extends Widget>(Finder helloWorldElement) {
  var widget = helloWorldElement.evaluate().first.widget as T;
  return widget;
}
