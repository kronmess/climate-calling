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
          child: Icon(
            Icons.account_circle,
            size: 300,
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
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print('test');
                },
              ),
              //TODO: Replace with second button widget
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.transparent),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
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
