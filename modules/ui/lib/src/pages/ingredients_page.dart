
import 'package:flutter/material.dart';
import 'package:ui/src/pages/menu_widget.dart';

import '../commons/navigator_wrapper.dart';

class IngredientsPage extends StatefulWidget {
  final bool isTestInstance;
  final NavigatorWrapper navigatorWrapper;

  const IngredientsPage(this.navigatorWrapper, {super.key}) : isTestInstance = false;

  IngredientsPage.createTestInstance(this.navigatorWrapper) : isTestInstance = true;

  @override
  State<IngredientsPage> createState() => _IngredientsPageState();

  MenuWidget createMenuWidget() {
    if(isTestInstance)
      return MenuWidget.createNull();
    return MenuWidget(navigatorWrapper);
  }
}

class _IngredientsPageState extends State<IngredientsPage> {


  @override
  Widget build(BuildContext context) {
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.widget.createMenuWidget(),
        const Text("Hello World", 
            key: Key("hello_world"),
            style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
