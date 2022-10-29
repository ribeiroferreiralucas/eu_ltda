import 'package:flutter/material.dart';

class NavigatorWrapper extends NavigatorObserver {
  String _currentLocation = "";
  String get currentLocation => _currentLocation;
  
  @override
  NavigatorState? get navigator => _nullNavigator == null ? super.navigator : _nullNavigator; 
  NavigatorState? _nullNavigator;

  NavigatorWrapper();

  NavigatorWrapper.createNull({List<String> routes = const []}){
     _nullNavigator = NullNavigatorState(this, routes:routes);
  }

  void navegateTo(String rote) {
    try {
      navigator!.pushNamed(rote);
    } on FlutterError {
      throw RouteNotFound();
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _currentLocation = route.settings.name!;
    super.didPush(route, previousRoute);
  }

}

class RouteNotFound implements Exception { }


class NullNavigatorState implements NavigatorState {
  
  final NavigatorObserver navigatorObserver;
  final Set<String> routesSet;

  NullNavigatorState(this.navigatorObserver, {List<String> routes = const []}) 
  : routesSet = Set.of(routes);

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    if(!routesSet.contains(routeName)) {
      throw RouteNotFound();
    }
    var nullRoute = NullRoute(routeName);
    this.navigatorObserver.didPush(nullRoute, null);
    return Future.value();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}

class NullRoute implements Route {
  final NullRouteSetting settings;

  NullRoute(String name) : this.settings = NullRouteSetting(name);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class NullRouteSetting implements RouteSettings {
  final String name;

  NullRouteSetting(this.name);
  
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}