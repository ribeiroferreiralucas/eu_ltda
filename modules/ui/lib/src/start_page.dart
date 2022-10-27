
import 'package:flutter/material.dart';
import 'package:ui/src/menu_widget.dart';

class StartPage extends StatefulWidget {
  final bool isTestInstance;

  const StartPage({super.key}) : isTestInstance = false;

  StartPage.createTestInstance() : isTestInstance = true;

  @override
  State<StartPage> createState() => _StartPageState();

  MenuWidget createMenuWidget() {
    if(isTestInstance)
      return MenuWidget.createNull();
    return MenuWidget();
  }
}

class _StartPageState extends State<StartPage> {


  @override
  Widget build(BuildContext context) {
    
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        this.widget.createMenuWidget(),
        const Text("Hello World", 
            key: Key("hello_world"),
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
