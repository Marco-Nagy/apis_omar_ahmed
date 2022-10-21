import 'package:flutter/material.dart';

Widget backButton = Row(
  children: [
    Image.asset(
      'assets/img/backButtonWeb.png',
      color: const Color.fromRGBO(240, 75, 152, 0.90),
      height: 40,
      width: 40,
    ),
    const Text(
      "Back",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(240, 75, 152, 0.90),
      ),
    ),
  ],
);
