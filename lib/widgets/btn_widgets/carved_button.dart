import 'package:flutter/material.dart';

import '../../../../../utilities/constants.dart';

class CarvedButton extends StatelessWidget {
  const CarvedButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(2),
            topRight: Radius.circular(2),
            topLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: defaultFont,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
