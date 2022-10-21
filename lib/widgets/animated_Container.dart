import 'package:flutter/cupertino.dart';

import '../../../../utilities/constants.dart';

Widget animatedContainer(
    {required bool condition,
    required double height,
    required double width,
    required Widget child}) {
  return AnimatedContainer(
    duration: const Duration(seconds: 1),
    height: condition ? null : 0,
    child: Container(
      height: height,
      width: width,
      decoration: condition ? containerDecorationList : null,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: child,
      ),
    ),
  );
}
