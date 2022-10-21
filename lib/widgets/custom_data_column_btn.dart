import 'package:flutter/material.dart';

import 'btn_widgets/bordered_btn.dart';

DataCell customDataCellButton({
  required String text,
  required Function onTap,
  required Color color,
}) {
  return DataCell(
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: BorderedButton(
        text: text,
        color: color,
        onTap: () => onTap(),
      ),
    ),
  );
}
