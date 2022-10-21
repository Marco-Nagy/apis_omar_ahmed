import 'package:flutter/material.dart';

import '../../../../config/themes/fonts.dart';

class TableHeaderCell extends StatelessWidget {
  const TableHeaderCell({
    Key? key,
    required this.text,
    this.controller,
    this.onTap,
    this.onChanged,
    this.enabled,
  }) : super(key: key);

  final String text;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function? onChanged;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffe6f1fb),
      ),
      child: TextFormField(
        onTap: onTap,
        onChanged: (value) => onChanged!(value),
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(
            fontFamily: AppFonts.ubuntu,
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
          ),
          hintStyle: const TextStyle(
            fontFamily: AppFonts.ubuntu,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
          ),
          suffixIcon: enabled == true
              ? const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                    size: 20,
                  ),
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: controller != null
                  ? controller!.text.isEmpty
                      ? Colors.transparent
                      : Colors.blue
                  : Colors.transparent,
              width: 2.0,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        enabled: enabled,
      ),
    );
  }
}
