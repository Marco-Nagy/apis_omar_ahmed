import 'package:flutter/material.dart';

Widget forwardButton({required Color color, required String text}) {
  return Row(
    children: [
      Container(
        height: 35,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            topLeft: Radius.circular(18),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 3.5),
      Container(
        height: 35,
        width: 45,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
      )
    ],
  );
}
