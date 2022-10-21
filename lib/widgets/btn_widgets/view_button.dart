import 'package:flutter/material.dart';

import '../../../../../utilities/constants.dart';

class ViewButton extends StatelessWidget {
  const ViewButton({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: const EdgeInsets.all(2.0),
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            "View",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: defaultFont,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: secondBlueColor,
            ),
          ),
        ),
      ),
    );
  }
}
