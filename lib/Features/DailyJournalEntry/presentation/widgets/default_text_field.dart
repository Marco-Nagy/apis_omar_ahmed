import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/fonts.dart';
import 'my_icon.dart';

Widget defaultTextField(
        {TextEditingController? controller,
        required TextInputType type,
        double? height,
        Color? color,
        int? maxLines,
        TextInputAction inputAction = TextInputAction.next,
        FormFieldValidator? validator,
        String? label,
        String? hint,
        String? prefixIconImage,
        InputBorder? enabledBorder,
        InputBorder? focusedBorder,
        Widget? suffixIcon,
        ValueChanged<String>? onChange,
        FormFieldSetter<String>? onSaved,
        Function? onFieldSubmitted,
        bool obscureText = false,
        GestureTapCallback? onTap,
        bool isNumber = false,
        required IconData prefixIcon}) =>
    Container(
      color: color,
      height: height ?? 55,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        obscureText: obscureText,
        keyboardType: type,
        maxLines: maxLines,
        textInputAction: inputAction,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
          prefixIcon: prefixIconImage == null
              ? null
              : myIcon(prefixIconImage: prefixIconImage),
          enabled: true,
          labelText: label,
          labelStyle: const TextStyle(
              fontFamily: AppFonts.ubuntu,
              fontWeight: FontWeight.w500,
              fontSize: 18),
          hintText: hint,
          hintStyle: const TextStyle(
              fontFamily: AppFonts.ubuntu,
              fontWeight: FontWeight.w500,
              fontSize: 18),
          enabledBorder: enabledBorder ??
              const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textDarkGrey, width: 3),
              ),
          focusedBorder: focusedBorder ??
              const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightBlue, width: 3),
              ),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
        onSaved: onSaved,
        onChanged: onChange,
        inputFormatters: isNumber
            ? [
                FilteringTextInputFormatter.allow(RegExp(
                  r'[0-9]',
                )),
                FilteringTextInputFormatter.digitsOnly,
                //
                BRNumberInputFormatter(),
                // ThousandsFormatter(allowFraction: true),

                LengthLimitingTextInputFormatter(14),
              ]
            : [], // Only numbers can be entered
      ),
    );

Widget myDivider({Color? color}) => Divider(
      color: color ?? AppColors.offWhite3,
      thickness: 2,
      height: 5,
    );

class BRNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    double value = double.parse(newValue.text) / 100;
    final formatter = NumberFormat.currency(
      customPattern: '#,###.##',
    );
    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
