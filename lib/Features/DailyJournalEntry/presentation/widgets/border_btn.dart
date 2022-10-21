import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/fonts.dart';
import 'decoration_widgets.dart';

Widget myBorderButton(
    {required VoidCallback onPress, required String text, Color? color}) {
  return MaterialButton(
      padding: EdgeInsets.zero,
      shape: editButtonInputDecoration(),
      onPressed: onPress,
      child: Text(
        'Edit',
        style: TextStyle(
            fontSize: 11,
            fontStyle: FontStyle.italic,
            fontFamily: AppFonts.ubuntu,
            fontWeight: FontWeight.bold,
            color: color),
      ));
}
