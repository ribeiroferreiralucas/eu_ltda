import 'package:flutter/widgets.dart';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

Widget buildWidget(Widget widget){
  return new MediaQuery (
        data: new MediaQueryData.fromWindow(window), 
        child: new Directionality(
            textDirection: TextDirection.rtl,
            child: widget
        )
  );
            
} 


T getSingleAs<T extends Widget>(Finder helloWorldElement) {
  var widget = helloWorldElement.evaluate().first.widget as T;
  return widget;
}
