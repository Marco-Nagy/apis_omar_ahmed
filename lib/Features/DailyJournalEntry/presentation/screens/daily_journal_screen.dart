import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/screens/JournalEntryView/journal_entry_view.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/screens/journal_entries_list.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/journal_entry_filter.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/fonts.dart';
import '../providers/daily_journal_provider.dart';
import '../widgets/my_icon.dart';
import 'AddNewJournal/add_new_journal.dart';

class DailyJournalScreen extends StatefulWidget {
  const DailyJournalScreen({Key? key}) : super(key: key);

  @override
  DailyJournalScreenState createState() => DailyJournalScreenState();
}

class DailyJournalScreenState extends State<DailyJournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return Scaffold(
          drawer: const JournalEntryFilter(),
          body: SafeArea(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      djp.updateJournalEntryScreen(false);
                                      djp.expandedDailyJournalList(false);
                                    },
                                    child: Row(
                                      children: [
                                        myIcon(
                                            prefixIconImage:
                                                'assets/icons/back_to_schedule.png',
                                            size: 30),
                                        const Text(
                                          'Back',
                                          style: TextStyle(
                                            fontFamily: AppFonts.ubuntu,
                                            color: AppColors.fuchsia,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Daily Journal Entry',
                                      style: TextStyle(
                                        fontFamily: AppFonts.ubuntu,
                                        color: AppColors.appBlue,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SizedBox(
                                      width: context.width / 16,
                                      height: 45,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              '2022 YTD',
                                              style: TextStyle(
                                                color: AppColors.textDarkGrey,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: AppFonts.montserrat,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: AppColors.appDarkRed,
                                            thickness: 1.5,
                                            height: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SizedBox(
                                      width: context.width / 14,
                                      height: 44,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: const [
                                                    FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        'Creator:',
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .textTitle,
                                                          fontFamily:
                                                              AppFonts.ubuntu,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        'مينا سمير فاروق',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: AppFonts
                                                              .NotoSansArabic,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                const CircleAvatar(
                                                  radius: 16,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/profile.png'),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            color: AppColors.appDarkRed,
                                            thickness: 1.5,
                                            height: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      djp.updateJournalEntryScreen(true);
                                      djp.expandedDailyJournalList(true);
                                      djp.clearData();
                                    },
                                    backgroundColor: AppColors.appGreen,
                                    elevation: 8,
                                    hoverElevation: 2,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: myIcon(
                                        prefixIconImage:
                                            'assets/icons/plus.png',
                                        color: Colors.white,
                                        size: 15),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                myIcon(
                                    prefixIconImage:
                                        'assets/icons/group_ico.png',
                                    size: 30),
                                const SizedBox(
                                  width: 5,
                                ),
                                myIcon(
                                    prefixIconImage:
                                        'assets/icons/filter_ico.png',
                                    size: 30),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        curve: Curves.easeInOutCubicEmphasized,
                        duration: const Duration(seconds: 1),
                        height: context.height - 80,
                        width: djp.isExpandedDailyJournal == true
                            ? 30
                            : djp.isExpandedDailyJournal == false &&
                                    context.width <= 1024
                                ? context.width
                                : context.width / 2.90,
                        child: InkWell(
                          onTap: () async {
                            if (djp.isSheetExpanded == true) {
                              djp.dateIndex = -1;
                              Navigator.pop(context);
                              djp.onBottomSheetExpanded(isExpanded: false);
                            }
                            await djp.updateJournalEntryScreen(false);
                            await djp.expandedDailyJournalList(false);
                          },
                          child: djp.isExpandedDailyJournal
                              ? Container(
                                  color: AppColors.offWhite2,
                                  child: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.lightBlue,
                                  ),
                                )
                              : const JournalEntriesList(),
                        ),
                      ),
                      Expanded(
                        child: djp.journalEntry
                            ? const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: AddNewJournal(),
                              )
                            : const JournalEntryView(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
