import 'package:flutter/material.dart';

class AppTextStyle {
  TextStyle descriptionBold(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: 15,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }
  TextStyle title(BuildContext context, Color color) {
    return TextStyle(
      color: color,
      fontSize: 17,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    );
  }
}