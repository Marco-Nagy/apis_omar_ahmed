import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

DataCell customDataCell({
  required String text,
  double? width,
}) {
  return DataCell(
    SizedBox(
      width: width == 0 ? null : 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: defaultFont,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
