import 'package:apis_omar_ahmed/config/themes/colors.dart';
import 'package:flutter/material.dart';

BoxDecoration myBoxDecoration() => BoxDecoration(
    color: Colors.white,
    border: const Border(
      bottom: BorderSide(color: AppColors.borderGray, width: 1.8),
      top: BorderSide(color: AppColors.borderGray, width: 1.8),
      right: BorderSide(color: AppColors.borderGray, width: 1.8),
      left: BorderSide(color: AppColors.borderGray, width: 1.8),
    ),
    borderRadius: BorderRadius.circular(25));

OutlineInputBorder myEnableInputDecoration() => OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.borderGray, width: 1.8),
    borderRadius: BorderRadius.circular(25));

OutlineInputBorder myFocusInputDecoration() => OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.appBlue, width: 1.8),
    borderRadius: BorderRadius.circular(25));

OutlineInputBorder myRightEnableInputDecoration() => const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGray, width: 1.8),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    );

OutlineInputBorder myRightFocusInputDecoration() => const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGray, width: 1.8),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    );

OutlineInputBorder myLeftEnableInputDecoration() => const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGray, width: 1.8),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    );

OutlineInputBorder myLeftFocusInputDecoration() => const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderGray, width: 1.8),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    );

OutlineInputBorder editButtonInputDecoration() => const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.orange, width: 1.8),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
    );
OutlineInputBorder deleteButtonInputDecoration() => const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.appRed, width: 1.8),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
    );
OutlineInputBorder updateButtonInputDecoration() => const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.appBlue, width: 1.8),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
    );
OutlineInputBorder cancelButtonInputDecoration() => const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.amber, width: 1.8),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
    );
