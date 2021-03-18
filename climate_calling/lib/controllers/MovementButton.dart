import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovementButton extends StatelessWidget {
  final child;
  final functionDown;
  final functionUp;
  static bool holdingButton = false;

//
MovementButton({this.child, this.functionDown,this.functionUp});

bool userIsHoldingButton() {
  return holdingButton;
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_){
        holdingButton = true;
        functionDown();
      },
      onPanEnd:  (_){
        holdingButton = false;
        functionUp();
      },
      child: Container(
        child: this.child,
        height: 64,
        width: 64,
      )
 
    );
  }
}