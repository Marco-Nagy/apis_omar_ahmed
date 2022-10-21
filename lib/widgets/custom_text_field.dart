import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utilities/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.textController,
    required this.onTap,
    required this.onChanged,
    required this.labelText,
    required this.hintText,
    this.inputFormatters,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController? textController;
  final Function onTap;
  final Function onChanged;
  final String labelText;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      child: TextFormField(
        controller: textController,
        onTap: () => onTap(),
        onChanged: (value) => onChanged(value),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        decoration: textFormFieldFilterDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
        inputFormatters: inputFormatters != null
            ? inputFormatters
            : [FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]"))],
        readOnly: readOnly,
      ),
    );
  }
}
