import 'package:flutter/material.dart';

import '../../../../utilities/constants.dart';

class CheckBoxWithText extends StatefulWidget {
  const CheckBoxWithText(
      {Key? key, required this.text, required this.status, required this.onTap})
      : super(key: key);
  final String text;
  final bool status;
  final Function() onTap;

  @override
  State<CheckBoxWithText> createState() => _CheckBoxWithTextState();
}

class _CheckBoxWithTextState extends State<CheckBoxWithText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            widget.onTap();
          },
          child: Checkbox(
            value: widget.status,
            onChanged: (value) {
              widget.onTap();
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: secondBlueColor,
          ),
        ),
        const SizedBox(width: 1.5),
        Text(
          widget.text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xff6b6b6b),
          ),
        )
      ],
    );
  }
}
