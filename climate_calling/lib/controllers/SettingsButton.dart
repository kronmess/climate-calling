import "package:flutter/material.dart";

class SettingsButton extends GestureDetector {
  //Constructor
  SettingsButton(
      {@required AssetImage image,
      String text,
      Function onTap,
      Color color = Colors.transparent,
      EdgeInsets padding})
      : super(
          child: Container(
            padding: padding ?? EdgeInsets.fromLTRB(5, 5, 10, 10),
            decoration: BoxDecoration(
              color: color,
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
            child: Text(text ?? ""),
          ),
          onTap: onTap,
        );
}
