import 'package:flutter/material.dart';

Widget myIcon({required String prefixIconImage, Color? color, double? size}) =>
    Image(
      image: AssetImage(
        prefixIconImage,
      ),
      height: size,
      width: size,
      color: color,
      fit: BoxFit.scaleDown,
    );
