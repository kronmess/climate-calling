import "package:flutter/material.dart";

class BackgroundButton extends GestureDetector {
  //Constructor
  BackgroundButton({@required AssetImage image, String text, Function onTap, Color color = Colors.black}) : super(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: Text(text ?? ""),
      ),
      onTap: onTap,
    );
}