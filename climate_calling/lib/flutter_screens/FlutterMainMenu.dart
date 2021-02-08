import "package:flutter/material.dart";

class FlutterMainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Create main menu widget tree
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: Container(), //TODO: Replace with logo widget here
        ),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //TODO: Put the first button widgets here
              SizedBox(width: 10,),
              //TODO: Put the second button widgets here
            ],
          ),
        ),
      ],
    );
  }
}