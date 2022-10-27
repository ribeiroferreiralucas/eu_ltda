import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget{
  
  MenuWidget() {}

  factory MenuWidget.createNull() {
    return NullMenuWidget(); 
  }

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
            onPressed: () {},
          ),
        ],
      )
    );
  }
}

class NullMenuWidget extends MenuWidget {

  @override
  Widget build(BuildContext context) { 
    return Container();
  }
}



