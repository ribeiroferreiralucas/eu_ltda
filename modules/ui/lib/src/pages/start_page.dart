
import 'package:flutter/material.dart';
import 'package:ui/src/pages/menu_widget.dart';

import '../commons/navigator_wrapper.dart';

class StartPage extends StatefulWidget {
  final bool isTestInstance;
  final NavigatorWrapper navigatorWrapper;

  const StartPage(this.navigatorWrapper, {super.key}) : isTestInstance = false;

  StartPage.createTestInstance(this.navigatorWrapper) : isTestInstance = true;

  @override
  State<StartPage> createState() => _StartPageState();

  MenuWidget createMenuWidget() {
    if(isTestInstance)
      return MenuWidget.createNull();
    return MenuWidget(navigatorWrapper);
  }
}

class _StartPageState extends State<StartPage> {


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
