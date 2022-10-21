import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/my_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/fonts.dart';
import '../../providers/daily_journal_provider.dart';
import '../../widgets/decoration_widgets.dart';
import 'account_item_widgets/account_item_builder.dart';

class NewJournalEntry extends StatefulWidget {
  const NewJournalEntry({Key? key}) : super(key: key);

  @override
  State<NewJournalEntry> createState() => _NewJournalEntryState();
}

class _NewJournalEntryState extends State<NewJournalEntry> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    const Text(
                                      'New Journal Entry',
                                      style: TextStyle(
                                        fontFamily: AppFonts.ubuntu,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    myIcon(
                                        prefixIconImage:
                                            'assets/icons/lock_open.png',
                                        size: 18),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    myIcon(
                                        prefixIconImage:
                                            'assets/icons/remove_eye.png',
                                        size: 18),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 34,
                                          ),
                                          myIcon(
                                              prefixIconImage:
                                                  'assets/icons/calender.png',
                                              size: 15),
                                          const SizedBox(width: 4),
                                          const Text(
                                            'Creation Date',
                                            style: TextStyle(
                                                color: AppColors.textDarkGrey,
                                                fontSize: 14,
                                                fontFamily: AppFonts.ubuntu,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 30),
                                      Text(
                                        djp.now,
                                        style: const TextStyle(
                                            color: AppColors.textDarkGrey,
                                            fontSize: 14,
                                            fontFamily: AppFonts.ubuntu,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          myIcon(
                                              prefixIconImage:
                                                  'assets/icons/info_green.png',
                                              size: 15),
                                          const SizedBox(width: 2),
                                          myIcon(
                                              prefixIconImage:
                                                  'assets/icons/lock_open.png',
                                              size: 15),
                                          const SizedBox(width: 2),
                                          myIcon(
                                              prefixIconImage:
                                                  'assets/icons/calender.png',
                                              size: 15),
                                          const SizedBox(width: 5),
                                          const Text(
                                            'Entry Date',
                                            style: TextStyle(
                                                color: AppColors.textDarkGrey,
                                                fontSize: 14,
                                                fontFamily: AppFonts.ubuntu,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          dateTextField(),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          myIcon(
                                              prefixIconImage:
                                                  'assets/icons/personal_file_small.png',
                                              size: 31),
                                          const SizedBox(width: 2),
                                          const Text(
                                            '#',
                                            style: TextStyle(
                                              fontFamily: AppFonts.baloo,
                                              fontSize: 22,
                                              color: AppColors.hashGrey,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 7),
                                          const Text(
                                            'Ref.\Doc #',
                                            style: TextStyle(
                                                color: AppColors.textDarkGrey,
                                                fontSize: 14,
                                                fontFamily: AppFonts.ubuntu,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 35),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            height: 25,
                                            child: TextFormField(
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                // isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        5.0, 1.0, 5.0, 1.0),
                                                enabledBorder:
                                                    myEnableInputDecoration(),
                                                focusedBorder:
                                                    myFocusInputDecoration(),
                                              ),
                                              controller:
                                                  djp.documentController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'General Description',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AppFonts.ubuntu,
                                            fontStyle: FontStyle.italic,
                                            color: AppColors.textTitle,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          maxLines: 3,
                                          style: const TextStyle(
                                              color: AppColors.textDarkGrey,
                                              fontSize: 14,
                                              fontFamily: AppFonts.ubuntu,
                                              fontWeight: FontWeight.w700),
                                          controller: djp.descriptionController,
                                          textDirection: djp.isRTL(djp.descriptionController.text) ? TextDirection.rtl : TextDirection.ltr,
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                myEnableInputDecoration(),
                                            focusedBorder:
                                                myFocusInputDecoration(),
                                          ),
                                          keyboardType: TextInputType.multiline,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: AccountItemBuilder(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  dateTextField() {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return InkWell(
          onTap: () {
            djp.expandedDatePicker(true);
          },
          child: Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: myBoxDecoration(),
            child: Text(
              djp.selectedDate == null
                  ? "Select Date"
                  : djp.dateController.text,
              style: const TextStyle(
                  color: AppColors.textDarkGrey,
                  fontSize: 14,
                  fontFamily: AppFonts.ubuntu,
                  fontWeight: FontWeight.w700),
            ),
          ),
        );
      },
    );
  }
}
