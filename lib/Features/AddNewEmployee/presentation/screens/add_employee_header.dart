import 'package:apis_omar_ahmed/widgets/btn_widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

Widget addEmployeeHeader(context) {
  return Column(
    children: [
      SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: backButton),
            const SizedBox(
              width: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Add New Employee',
                style: webTitleStyle,
              ),
            ),
          ],
        ),
      ),
      const Divider(),
    ],
  );
}
