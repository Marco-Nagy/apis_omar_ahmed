import 'package:apis_omar_ahmed/config/themes/colors.dart';
import 'package:apis_omar_ahmed/config/themes/fonts.dart';
import 'package:flutter/material.dart';

class MyDropDownButton extends StatelessWidget {
  MyDropDownButton(
      {Key? key,
      required this.dropDownList,
      required this.initValue,
      required this.onChange})
      : super(key: key);
  List dropDownList;
  var initValue;
  ValueChanged onChange;
  Colors? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: null,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.borderGray, width: 1.8),
      ),
      key: UniqueKey(),
      child: DropdownButton<String>(
        value: initValue,
        icon:
            const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
        dropdownColor: Colors.white,
        elevation: 16,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: AppFonts.ubuntu,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        onChanged: (value) => onChange(value),
        selectedItemBuilder: (BuildContext context) {
          return dropDownList.map((value) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Text(
                  value.name,
                  style: const TextStyle(
                    fontFamily: AppFonts.ubuntu,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }).toList();
        },
        items: dropDownList.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            value: value.name,
            child: Padding(
              padding: const EdgeInsets.all(3.5),
              child: Text(
                value.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: AppFonts.ubuntu,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
