import 'package:apis_omar_ahmed/config/themes/fonts.dart';
import 'package:flutter/material.dart';

class TableItemCell extends StatelessWidget {
  const TableItemCell(
      {Key? key, required this.text, this.width, this.alignment})
      : super(key: key);
  final String text;
  final double? width;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: width,
      alignment: alignment ?? Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: AppFonts.ubuntu,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
