
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/src/commons/navigator_wrapper.dart';


void main() {
  group("The NavigatorWrapper", () {
    
    testWidgets("should navegate to a rote and see the current location", (WidgetTester tester) async {

      var navigatorApp = NavigatorApp();
      await tester.pumpWidget(navigatorApp);
      var navigatorWrapper = navigatorApp.navigatorWrapper;
      navigatorWrapper.navegateTo("/page1");

      expect(navigatorWrapper.currentLocation, "/page1");
    });

    testWidgets("should navegate to from any route to any route", (WidgetTester tester) async {

      var navigatorApp = NavigatorApp();
      await tester.pumpWidget(navigatorApp);
      var navigatorWrapper = navigatorApp.navigatorWrapper;

      navigatorWrapper.navegateTo("/page1");
      expect(navigatorWrapper.currentLocation, "/page1");

      navigatorWrapper.navegateTo("/page2");
      expect(navigatorWrapper.currentLocation, "/page2");
      
      navigatorWrapper.navegateTo("/");
      expect(navigatorWrapper.currentLocation, "/");
      
    });

    testWidgets("should throws RouteNotFound if notconfigurated rote", (WidgetTester tester) async {

      var navigatorApp = NavigatorApp();
      await tester.pumpWidget(navigatorApp);
      var navigatorWrapper = navigatorApp.navigatorWrapper;

      expect(() => navigatorWrapper.navegateTo("/unknowpage"), throwsA(isA<RouteNotFound>()));
        
    });

    testWidgets("should not normalize CASE rote", (WidgetTester tester) async {

      var navigatorApp = NavigatorApp();
      await tester.pumpWidget(navigatorApp);
      var navigatorWrapper = navigatorApp.navigatorWrapper;

      expect(() => navigatorWrapper.navegateTo("/PAGE1"), throwsA(isA<RouteNotFound>()));

    });


    testWidgets("should not normalize spaces in rote", (WidgetTester tester) async {

      var navigatorApp = NavigatorApp();
      await tester.pumpWidget(navigatorApp);
      var navigatorWrapper = navigatorApp.navigatorWrapper;

      expect(() => navigatorWrapper.navegateTo("/page1  "), throwsA(isA<RouteNotFound>()));
    });
  }); 

  group("The Null NavigatorWrapper", () {
    testWidgets("should configure possible routes and navegate to it", (WidgetTester tester) async {
      var navigatorWrapper = NavigatorWrapper.createNull(routes: ["/page1"]);
      
      navigatorWrapper.navegateTo("/page1");

      expect(navigatorWrapper.currentLocation, "/page1");
    });
    
  });
}


class NavigatorApp extends StatelessWidget {
 
  final NavigatorWrapper navigatorWrapper = NavigatorWrapper();
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      home: MainPage(), 
      routes: <String, WidgetBuilder> {
        '/page1': (BuildContext context) => Page1(),
        '/page2': (BuildContext context) => Page2()
      },
      navigatorObservers: [this.navigatorWrapper],
    );
    return materialApp;
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Container();
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Container();
  }
}
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Container();
  }
}

class MyNavigatorObserver extends NavigatorObserver {
}