import 'package:apis_omar_ahmed/config/themes/fonts.dart';
import 'package:flutter/material.dart';

InputDecoration textFormFieldFilterDecoration(
    {required labelText, required hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(
      fontFamily: AppFonts.ubuntu,
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: Colors.black54,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: labelText,
    labelStyle: const TextStyle(
      fontFamily: AppFonts.ubuntu,
      fontSize: 22,
      fontWeight: FontWeight.w900,
      color: Colors.black54,
      fontStyle: FontStyle.italic,
    ),
    contentPadding: const EdgeInsets.only(left: 10, right: 10),
    suffix: const RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.search,
        color: Colors.black54,
        size: 13,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
        bottomRight: Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.25),
        width: 1.0,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}

InputDecoration textFormFieldColumnDecoration(
    {required labelText, required hintText}) {
  return InputDecoration(
    hintText: labelText,
    hintStyle: const TextStyle(
      fontFamily: AppFonts.ubuntu,
      fontSize: 13,
      fontWeight: FontWeight.w800,
      color: Colors.black54,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: hintText,
    labelStyle: const TextStyle(
      fontFamily: AppFonts.ubuntu,
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: Colors.black54,
      fontStyle: FontStyle.italic,
    ),
    contentPadding: const EdgeInsets.only(left: 10, right: 10),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
        bottomRight: Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      ),
    ),
  );
}
