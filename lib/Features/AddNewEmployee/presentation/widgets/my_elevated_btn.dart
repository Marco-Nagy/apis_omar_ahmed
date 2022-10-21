import 'package:flutter/material.dart';

Widget myElevatedButton({
  required backGroundColor,
  required text,
  required textColor,
  required onPress,
  textPadding,
}) {
  return FittedBox(
      fit: BoxFit.scaleDown,
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => backGroundColor),
          elevation: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return 20;
              } //<-- SEE HERE
              return 2; // Defer to the widget's default.
            },
          ),
          // overlayColor: MaterialStateProperty.resolveWith<Color?>(
          //   (Set<MaterialState> states) {
          //     if (states.contains(MaterialState.hovered)) {
          //       return AppColors.offWhite2;
          //     } //<-- SEE HERE
          //     return Colors.grey.shade400; // Defer to the widget's default.
          //   },
          // ),
        ),
        child: Padding(
          padding: textPadding ?? const EdgeInsets.all(0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ));
}
