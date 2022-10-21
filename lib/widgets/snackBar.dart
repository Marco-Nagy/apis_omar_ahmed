import 'package:flutter/material.dart';

import '../../../../config/themes/fonts.dart';

showSnackBar({context, msg, required backgroundColor}) {
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: const TextStyle(
        fontFamily: AppFonts.ubuntu,
      ),
    ),
    backgroundColor: backgroundColor,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSnackBarWarning(context, msg) {
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: const TextStyle(
        fontFamily: AppFonts.ubuntu,
      ),
    ),
    backgroundColor: const Color(0xffff0000),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showSnackBarDone(context, msg) {
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: const TextStyle(
        fontFamily: AppFonts.ubuntu,
      ),
    ),
    backgroundColor: const Color(0xff3acc44),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class SnackBarMsgType {
  Color warningMsg = const Color(0xffff0000);
  Color successMsg = const Color(0xff3acc44);
  Color errorMsg = const Color(0xff197093);
}
