import 'package:flutter/material.dart';

import '../../../../../utilities/constants.dart';

class BorderedButton extends StatelessWidget {
  const BorderedButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.color,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontStyle: FontStyle.italic,
              fontFamily: UbuntuFont,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
