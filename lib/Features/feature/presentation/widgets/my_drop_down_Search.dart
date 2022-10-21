import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/fonts.dart';
import '../../../DailyJournalEntry/presentation/widgets/decoration_widgets.dart';

Widget myDropDownSearch<T>({
  required BuildContext context,
  required String hintText,
  required bool searchBox,
  required Function(String) data,
  required Function(BuildContext?, T, bool?) customPopupItemBuilder,
  required Function(T item, T sItem) compareFn,
  required Function(T item) onChanged,
  required TextEditingController dropDownController,
  InputBorder? border,
  InputBorder? enabledBorder,
  InputBorder? disabledBorder,
  Widget? suffix,
  FormFieldSetter<T>? onSaved,
}) {
  return DropdownSearch<T>(
    asyncItems: (String filter) async => await data(filter),
    compareFn: (T item, T sItem) => item == sItem,
    popupProps: PopupProps.menu(
      loadingBuilder: (context, searchEntry) {
        return const Center(child: CircularProgressIndicator());
      },
      menuProps: MenuProps(
        elevation: 16,
        borderRadius: BorderRadius.circular(15),
        shadowColor: AppColors.hintText,
      ),
      constraints: const BoxConstraints(maxHeight: 240, minWidth: 200),
      showSelectedItems: true,
      searchDelay: const Duration(milliseconds: 500),
      itemBuilder: (BuildContext? context, T dataModel, bool? isSelected) =>
          customPopupItemBuilder(context!, dataModel!, isSelected!),
      showSearchBox: searchBox,
      searchFieldProps: TextFieldProps(
        padding: const EdgeInsets.all(5),
        cursorHeight: 20,
        controller: dropDownController,
        decoration: InputDecoration(
          suffix: suffix,
          border: myEnableInputDecoration(),
          constraints: const BoxConstraints(maxHeight: 30),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => dropDownController.clear(),
          ),
        ),
      ),
    ),
    dropdownDecoratorProps: DropDownDecoratorProps(
      textAlign: TextAlign.start,
      dropdownSearchDecoration: InputDecoration(
        border: border ?? myEnableInputDecoration(),
        enabledBorder: enabledBorder ?? myEnableInputDecoration(),
        disabledBorder: disabledBorder ?? myFocusInputDecoration(),
        contentPadding: const EdgeInsets.only(left: 15),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.ubuntu,
        ),
        //labelText: hintText,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          //fontFamily: AppFonts.ubuntu,
        ),
        filled: true,
        constraints: const BoxConstraints(maxHeight: 30, minHeight: 20),
        fillColor: Colors.white,
        enabled: true,
        suffixIconColor: Colors.grey,
      ),
    ),
    onChanged: (T? item) => onChanged(item as T),
    onSaved: onSaved,
  );
}
