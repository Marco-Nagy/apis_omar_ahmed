import 'package:flutter/material.dart';

import '../../../../config/themes/fonts.dart';
import '../../../../utilities/constants.dart';

Widget removeItem(context, index) {
  return AlertDialog(
    title: const Text(
      'Remove Added item',
      style: TextStyle(
        fontFamily: AppFonts.ubuntu,
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: lightGreenColor,
      ),
    ),
    content: SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Are You Sure you want to Remove this ITEM',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: darkBlueColor,
                fontFamily: AppFonts.ubuntu,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context, 'Cancel'),
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Image.asset(
                    "assets/img/filter_icon_grey.png",
                    color: pinkColor,
                    width: 30,
                  ),
                ),
                Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: AppFonts.ubuntu,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: darkBlueColor,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Navigator.pop(context, 'Confirm'),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontFamily: AppFonts.ubuntu,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
