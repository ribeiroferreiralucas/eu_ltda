import 'package:flutter/material.dart';
import 'package:ui/src/commons/navigator_wrapper.dart';

class MenuWidget extends StatelessWidget{
  
  final NavigatorWrapper navigator;

  MenuWidget(this.navigator);

  MenuWidget.createNull() : this.navigator = NavigatorWrapper.createNull(); 

  @override
  Widget build(BuildContext context) { 
    return Container(
      width: 200,
      color: Color.fromARGB(255, 247, 199, 199),
      child: ListView(
        children: [
          const Text("Menu", 
            key: Key("menu"),
            style: TextStyle(fontSize: 20)
          ),
          TextButton(
            key: Key("toIngredientsPageBtn"),
            child: const Text("Ingredients"),
            onPressed: () {this.navigator.navegateTo("/ingredients");},
          ),
        ],
      )
    );
  }
}


