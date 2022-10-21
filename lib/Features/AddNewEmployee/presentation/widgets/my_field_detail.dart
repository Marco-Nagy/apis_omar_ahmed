import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

Widget myFieldDetail(title, value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: UbuntuFont,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: UbuntuFont,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
