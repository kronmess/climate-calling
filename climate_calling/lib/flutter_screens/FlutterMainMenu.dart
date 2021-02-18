import 'package:climate_calling/controllers/BackgroundButton.dart';
import "package:flutter/material.dart";

class FlutterMainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Create main menu widget tree
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Image(
            image: AssetImage("assets/images/logoapp.png"),
          ), //TODO: Replace with logo here
        ),
        SizedBox(
          height: 180,
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //TODO: Replace with first button widget
              BackgroundButton(
                image: AssetImage("assets/images/sprites/main menu buttons/main menu button.png"),
                text: "Start",
                onTap: (){
                  print("Hello there");
                },
              ),
              //TODO: Replace with second button widget
              FlatButton(
                textColor: Colors.black,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  'Game Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print('test');
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
