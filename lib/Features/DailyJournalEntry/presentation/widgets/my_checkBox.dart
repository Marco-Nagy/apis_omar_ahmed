import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:apis_omar_ahmed/config/themes/colors.dart';
import 'package:apis_omar_ahmed/config/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return const Color(0xfff9efef);
}

Widget buildSingleCheckbox(
  String text,
) =>
    buildCheckbox(
      text: text,
      onClicked: () {},
    );

Widget buildCheckbox({
  required String text,
  required VoidCallback onClicked,
}) =>
    InkWell(
      onTap: onClicked,
      child: Row(
        children: [
          Consumer<DailyJournalProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                // child: Checkbox(
                //   side: MaterialStateBorderSide.resolveWith(
                //       (_) => const BorderSide(
                //             width: 1,
                //             color: AppColors.textTitle,
                //           )),
                //   splashRadius: 15,
                //   checkColor: Colors.white,
                //   fillColor: MaterialStateProperty.all(AppColors.appBlue),
                //   value: false,
                //   onChanged: (bool? value) {},
                // ),
              );
            },
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.ubuntu,
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle),
            maxLines: 3,
          ),
        ],
      ),
    );
