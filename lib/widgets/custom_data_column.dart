import 'package:flutter/material.dart';

import '../../../../utilities/style.dart';

DataColumn customDataColumn({
  TextEditingController? controller,
  required String labelText,
  String? hintText,
  bool? readOnly,
  double? width,
}) {
  return DataColumn(
    label: Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width == 0
              ? null
              : width != null
                  ? width
                  : 200,
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            controller: controller,
            decoration: textFormFieldColumnDecoration(
              labelText: labelText,
              hintText: hintText,
            ),
            onChanged: (value) {},
            readOnly: readOnly != null ? readOnly : false,
          ),
        ),
      ),
    ),
  );
}
