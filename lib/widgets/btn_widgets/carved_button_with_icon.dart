import 'package:flutter/material.dart';

import '../../../../../utilities/constants.dart';

class CarvedButtonWithIcon extends StatelessWidget {
  const CarvedButtonWithIcon({
    Key? key,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  }) : super(key: key);
  final Function() onTap;
  final String text;
  final Color textColor;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          Container(
            height: 30,
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, bottom: 6, left: 8, right: 4),
              child: Icon(
                icon,
                color: iconColor,
                size: 16,
              ),
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(5),
              ),
            ),
          ),
          SizedBox(width: 2),
          Container(
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontFamily: defaultFont,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
