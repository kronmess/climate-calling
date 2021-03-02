import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovementButton extends StatelessWidget {
  final child;
  final function;
  static bool holdingButton = false;

//
MovementButton({this.child, this.function});

bool userIsHoldingButton() {
  return holdingButton;
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
        holdingButton = true;
        function();
      },
      onTapUp:  (_){
        holdingButton = false;
      },
      child: Container(
        child: this.child,
        height: 64,
        width: 64,
      )
 
    );
  }
}