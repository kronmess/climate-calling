import "package:flutter/material.dart";

class BackgroundButton extends GestureDetector {
  //Constructor
  BackgroundButton(
      {@required AssetImage image,
      Widget child,
      Function onTap,
      Color color = Colors.transparent,
      EdgeInsets padding})
      : super(
          child: Container(
            padding: padding ?? EdgeInsets.fromLTRB(50, 20, 50, 20),
            decoration: BoxDecoration(
              color: color,
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
            child: child ?? SizedBox(),
          ),
          onTap: onTap,
        );
}
