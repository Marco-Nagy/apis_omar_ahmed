import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/my_scrollableText.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/themes/fonts.dart';
import '../widgets/my_icon.dart';
import 'JournalEntryView/journal_entry_view.dart';

class JournalEntriesList extends StatefulWidget {
  const JournalEntriesList({Key? key}) : super(key: key);

  @override
  State<JournalEntriesList> createState() => _JournalEntriesListState();
}

class _JournalEntriesListState extends State<JournalEntriesList> {
  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    DailyJournalProvider djp =
        Provider.of<DailyJournalProvider>(context, listen: false);

    if (djp.entryDateListIsLoaded == false &&
        djp.entryPerDateListIsLoaded == false) {
      await djp
          .getDailyJournalEntryDateList(djp.filterSearchKeyController.text);
    } else {
      return;
    }
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, DailyJournalProvider djp, child) {
        return Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          djp.expandedDailyJournalList(true);
                        },
                        child: myIcon(
                          prefixIconImage: 'assets/icons/back_to.png',
                          size: 30,
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
                                onPressed: () {},
                                backgroundColor: AppColors.appGreen,
                                elevation: 8,
                                hoverElevation: 2,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: myIcon(
                                  prefixIconImage: 'assets/icons/plus.png',
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            myIcon(
                                prefixIconImage: 'assets/icons/group_ico.png',
                                size: 30),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 30,
                              child: FloatingActionButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: myIcon(
                                    prefixIconImage:
                                        'assets/icons/filter_ico.png',
                                    size: 30),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: djp.dailyJournalEntryDateModel.result == false
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.lightBlue,
                              backgroundColor: AppColors.offWhite2,
                              strokeWidth: 5,
                            ),
                          )
                        : ListView.builder(
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              if (djp.dateIndex == -1) {
                                djp.dateIndex = index;
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () async {
                                        djp.entryJournalCurrentPage = 1;
                                        djp.expandWebShrinkTile(index);
                                        if (scrollController.hasClients) {
                                          scrollController.jumpTo(index * 40);
                                        }

                                        djp.scrollDown(scrollController, index);
                                        await djp
                                            .resetDailyJournalEntryPerDate();
                                        if (djp.filterSearchKeyController.text
                                            .isNotEmpty) {
                                          await Future.delayed(
                                              const Duration(milliseconds: 2));
                                        } else {
                                          await Future.delayed(
                                              const Duration(seconds: 2));
                                        }
                                        await djp.getDailyJournalEntryPerDateList(
                                            searchKey: djp
                                                .filterSearchKeyController.text,
                                            dateToGetList: djp
                                                .dailyJournalEntryDateModel
                                                .dailyJournalEntryList[index]
                                                .dateToGetList,
                                            currentPage:
                                                '${djp.entryJournalCurrentPage}',
                                            numberOfItemsPerPage:
                                                '${djp.numberOfItemsPerPage}');
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15),
                                                child: Row(
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        djp
                                                            .dailyJournalEntryDateModel
                                                            .dailyJournalEntryList[
                                                                index]
                                                            .dateMonth,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              AppFonts.ubuntu,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: AppColors
                                                              .lightBlack,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    if (djp
                                                        .filterSearchKeyController
                                                        .text
                                                        .isNotEmpty)
                                                      Text(
                                                        '(${djp.dailyJournalEntryDateModel.dailyJournalEntryList[index].countOfEntry})',
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              AppFonts.ubuntu,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          color: AppColors
                                                              .lightBlack,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (djp.selectedIndex == index)
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      'J.Entry',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            AppFonts.ubuntu,
                                                        color:
                                                            AppColors.titleBlue,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      'Amount',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            AppFonts.ubuntu,
                                                        color:
                                                            AppColors.titleBlue,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Expanded(
                                                    flex: 2, child: SizedBox()),
                                                const Expanded(
                                                  child: Center(
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: const Text(
                                                        'Creator',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              AppFonts.ubuntu,
                                                          color: AppColors
                                                              .titleBlue,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          'Ref.No',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                AppFonts.ubuntu,
                                                            color: AppColors
                                                                .titleBlue,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
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
                                  djp.selectedIndex == index
                                      ? AnimatedContainer(
                                          curve: Curves.bounceInOut,
                                          duration:
                                              const Duration(milliseconds: 1),
                                          height: djp.selectedIndex == index &&
                                                  djp.filterSearchKeyController
                                                      .text.isNotEmpty
                                              ? djp
                                                      .dailyJournalEntryPerDateModel
                                                      .dailyJournalEntryList
                                                      .length *
                                                  60
                                              : djp.selectedIndex == index
                                                  ? 510
                                                  : 1,
                                          width: double.infinity,
                                          child: journalEntryItemBuilder(djp
                                              .dailyJournalEntryDateModel
                                              .dailyJournalEntryList[index]
                                              .dateToGetList),
                                        )
                                      : Container(),
                                ],
                              );
                            },
                            itemCount: djp.dailyJournalEntryDateModel
                                .dailyJournalEntryList.length,
                          ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget journalEntryItemBuilder(dateToGetList) {
    late ScrollController entryListPerDateScrollController;

    getData() {
      DailyJournalProvider djp = Provider.of(context, listen: false);

      if (entryListPerDateScrollController.positions.any((pos) =>
              pos.maxScrollExtent == entryListPerDateScrollController.offset) &&
          djp.entryJournalCurrentPage <
              djp.dailyJournalEntryPerDateModel.paginationHeader.totalPages) {
        djp.entryJournalCurrentPage++;

        djp.getDailyJournalEntryPerDateList(
            searchKey: djp.filterSearchKeyController.text,
            dateToGetList: dateToGetList,
            currentPage: '${djp.entryJournalCurrentPage}',
            numberOfItemsPerPage: '${djp.numberOfItemsPerPage}');

        djp.dailyJournalEntryPerDateModel.result = false;
      }
    }

    entryListPerDateScrollController = ScrollController()..addListener(getData);

    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
          child: djp.dailyJournalEntryPerDateModel.result == false
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.lightBlue,
                    backgroundColor: AppColors.offWhite2,
                    strokeWidth: 5,
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  controller: entryListPerDateScrollController,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var dailyJournalEntryInfoList =
                        djp.dailyJournalEntryList[index];

                    return InkWell(
                      onTap: () async {
                        djp.selectedAdjustEntryView = -1;
                        if (context.width > 1024) {
                          await djp.updateJournalEntryScreen(false);
                        } else {
                          Scaffold.of(context)
                              .showBottomSheet(
                                (context) => Container(
                                    padding: const EdgeInsets.all(10),
                                    //margin: const EdgeInsets.all(10),
                                    height: context.height * .8,
                                    color: Colors.transparent,
                                    child: const JournalEntryView()),
                                elevation: 20,
                                clipBehavior: Clip.antiAlias,
                              )
                              .closed
                              .then((value) {
                            djp.onBottomSheetExpanded(isExpanded: false);
                          });
                          djp.onBottomSheetExpanded(isExpanded: true);
                        }

                        await djp.getDailyJournalEntryInfoList(
                            dailyJournalEntryInfoList.id.toString());
                        await djp.countDebitCreditAmountEntryView(index);
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth: context.width, minWidth: 30),
                          color: Colors.white,
                          height: 50,
                          width: djp.isExpandedDailyJournal
                              ? 1
                              : context.width <= 1024
                                  ? context.width
                                  : context.width / 2.8,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      dailyJournalEntryInfoList.serial
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontFamily: AppFonts.ubuntu,
                                        color: AppColors.textDarkGrey,
                                        fontWeight: FontWeight.w800,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: AppColors.appGreen,
                                          size: 10,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_up_rounded,
                                          color: AppColors.appGreen,
                                          size: 15,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  djp
                                                      .formatter(
                                                          dailyJournalEntryInfoList
                                                              .amountTranaction)
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: AppFonts.ubuntu,
                                                    color: AppColors.listGrey,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                'Egp',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: AppFonts.ubuntu,
                                                    color: AppColors.listGrey,
                                                    fontWeight:
                                                        FontWeight.w900),
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  myIcon(
                                                      prefixIconImage:
                                                          'assets/icons/calender.png',
                                                      size: 15),
                                                  const Text(
                                                    'Entry Date',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .textDarkGrey,
                                                        fontSize: 11,
                                                        fontFamily:
                                                            AppFonts.ubuntu,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  const SizedBox(width: 18),
                                                  Text(
                                                    djp.convertJsonDateToDateTime(
                                                        dailyJournalEntryInfoList
                                                            .entryDate
                                                            .toString()),
                                                    style: const TextStyle(
                                                        color: AppColors
                                                            .textDarkGrey,
                                                        fontSize: 11,
                                                        fontFamily:
                                                            AppFonts.ubuntu,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  myIcon(
                                                      prefixIconImage:
                                                          'assets/icons/calender.png',
                                                      size: 15),
                                                  const Text(
                                                    'Creation Date',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .textDarkGrey,
                                                        fontSize: 11,
                                                        fontFamily:
                                                            AppFonts.ubuntu,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    djp.convertJsonDateToDateTime(
                                                        dailyJournalEntryInfoList
                                                            .creationDate
                                                            .toString()),
                                                    style: const TextStyle(
                                                      color: AppColors
                                                          .textDarkGrey,
                                                      fontSize: 11,
                                                      fontFamily:
                                                          AppFonts.ubuntu,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 3),
                                          myIcon(
                                            prefixIconImage:
                                                'assets/icons/lock_open.png',
                                            size: 18,
                                          ),
                                          const SizedBox(width: 3),
                                          myIcon(
                                            prefixIconImage:
                                                'assets/icons/remove_eye.png',
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: CircleAvatar(
                                                  radius: 12,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/profile.png'),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  dailyJournalEntryInfoList
                                                      .creationUser
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily:
                                                        AppFonts.NotoSansArabic,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: myScrollableText(
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 12, left: 10),
                                          child: Text(
                                            dailyJournalEntryInfoList
                                                .documentNumber
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: AppFonts.ubuntu,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: djp.dailyJournalEntryList.length,
                ),
        );
      },
    );
  }
}
