import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/fonts.dart';
import '../../providers/daily_journal_provider.dart';
import '../../screens/JournalEntryView/adjusting_entries_view.dart';
import '../../widgets/decoration_widgets.dart';
import '../../widgets/my_icon.dart';

class JournalEntryView extends StatefulWidget {
  const JournalEntryView({Key? key}) : super(key: key);

  @override
  JournalEntryViewState createState() => JournalEntryViewState();
}

class JournalEntryViewState extends State<JournalEntryView> {
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              /// * Header
                              Expanded(
                                flex: 3,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'J.Entry',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: AppFonts.ubuntu,
                                              color: AppColors.titleBlue,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          djp.dailyJournalEntryDataInfoModel
                                              .data.serial,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: AppFonts.ubuntu,
                                            color: AppColors.greyDark,
                                            fontWeight: FontWeight.w500,
                                          ),
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
                                      const SizedBox(
                                        width: 2.5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: SizedBox(
                                          width: 40,
                                          child: MaterialButton(
                                              padding: EdgeInsets.zero,
                                              shape:
                                                  editButtonInputDecoration(),
                                              onPressed: () async {},
                                              child: const Text(
                                                'Edit',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: AppFonts.ubuntu,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.orange),
                                              )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2.5,
                                      ),
                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: FloatingActionButton(
                                          onPressed: () {},
                                          child: myIcon(
                                            prefixIconImage:
                                                'assets/icons/go_next_.png',
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 32,
                                              ),
                                              myIcon(
                                                  prefixIconImage:
                                                      'assets/icons/calender.png',
                                                  size: 15),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Creation Date',
                                                style: TextStyle(
                                                    color:
                                                        AppColors.textDarkGrey,
                                                    fontSize: 14,
                                                    fontFamily: AppFonts.ubuntu,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            djp.convertJsonDateToDateTime(djp
                                                .dailyJournalEntryDataInfoModel
                                                .data
                                                .creationDate),
                                            style: const TextStyle(
                                                color: AppColors.textDarkGrey,
                                                fontSize: 14,
                                                fontFamily: AppFonts.ubuntu,
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                    color:
                                                        AppColors.textDarkGrey,
                                                    fontSize: 14,
                                                    fontFamily: AppFonts.ubuntu,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 30),
                                          Text(
                                            djp.convertJsonDateToDateTime(djp
                                                .dailyJournalEntryDataInfoModel
                                                .data
                                                .entryDate),
                                            style: const TextStyle(
                                                color: AppColors.textDarkGrey,
                                                fontSize: 14,
                                                fontFamily: AppFonts.ubuntu,
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                              const SizedBox(width: 6),
                                              const Text(
                                                'Ref.\Doc #',
                                                style: TextStyle(
                                                    color:
                                                        AppColors.textDarkGrey,
                                                    fontSize: 14,
                                                    fontFamily: AppFonts.ubuntu,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 10),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              djp.dailyJournalEntryDataInfoModel
                                                  .data.documentNumber,
                                              style: const TextStyle(
                                                  color: AppColors.textDarkGrey,
                                                  fontSize: 14,
                                                  fontFamily: AppFonts.ubuntu,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              /// * General Description
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        'General Description',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: AppFonts.ubuntu,
                                          fontStyle: FontStyle.italic,
                                          color: AppColors.textTitle,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: const Border(
                                            bottom: BorderSide(
                                                color: AppColors.borderGray,
                                                width: 1.8),
                                            top: BorderSide(
                                                color: AppColors.borderGray,
                                                width: 1.8),
                                            right: BorderSide(
                                                color: AppColors.borderGray,
                                                width: 1.8),
                                            left: BorderSide(
                                                color: AppColors.borderGray,
                                                width: 1.8),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        djp.dailyJournalEntryDataInfoModel.data
                                            .description,
                                        style: const TextStyle(
                                            color: AppColors.textDarkGrey,
                                            fontSize: 14,
                                            fontFamily: AppFonts.ubuntu,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.right,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
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
              const Divider(color: AppColors.appDarkRed, thickness: 1.5),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: AdjustEntriesView()),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
