import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/decoration_widgets.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/config/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JournalEntryFilter extends StatefulWidget {
  const JournalEntryFilter({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return JournalEntryFilterState();
  }
}

class JournalEntryFilterState extends State<JournalEntryFilter> {
  @override
  Widget build(BuildContext context) {
    return const Filter();
  }
}

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int indexNum = 0;
  DateTime purchaseTime = DateTime(DateTime.now().year);
  TextEditingController salesMan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, DailyJournalProvider djp, child) {
        return Stack(
          children: [
            InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                )),
            Column(
              children: [
                Container(
                  height: 125,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  margin: EdgeInsets.only(
                    left: context.width > 1024 ? 180 : 300,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: context.width > 1024
                            ? context.width * .20
                            : context.width * .3,
                        height: context.height / 5.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(5, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(
                              5,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(color: Colors.transparent),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, left: 8),
                                      child: Column(
                                        children: [
                                          /// * client Name
                                          SizedBox(
                                            height: 38,
                                            child: TextFormField(
                                                controller: djp
                                                    .filterSearchKeyController,
                                                onTap: () {},
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                decoration:
                                                    textFormFieldFilterDecorationFilter(
                                                        "Search ", "Search")),
                                          ),
                                          // const Divider(
                                          //   color: Colors.transparent,
                                          //   height: 20,
                                          // ),
                                          //
                                          // /// * project Name
                                          // SizedBox(
                                          //   height: 38,
                                          //   child: TextFormField(
                                          //       onTap: () {},
                                          //       style: const TextStyle(
                                          //           fontSize: 12,
                                          //           fontWeight: FontWeight.w400),
                                          //       decoration:
                                          //           textFormFieldFilterDecorationFilter(
                                          //               "project Name ",
                                          //               "Project Name")),
                                          // ),
                                          // const Divider(
                                          //   color: Colors.transparent,
                                          //   height: 20,
                                          // ),
                                          //
                                          // /// * sales Person Name
                                          // SizedBox(
                                          //   height: 38,
                                          //   child: TextFormField(
                                          //       onTap: () async {},
                                          //       style: const TextStyle(
                                          //           fontSize: 12,
                                          //           fontWeight: FontWeight.w400),
                                          //       decoration:
                                          //           textFormFieldFilterDecorationFilter(
                                          //               "All Sales Person",
                                          //               "sales Person Name")),
                                          // ),
                                          // AnimatedContainer(
                                          //   duration: const Duration(seconds: 1),
                                          //   height: 0,
                                          //   child: SizedBox(
                                          //     height: 300,
                                          //     child: Padding(
                                          //       padding: const EdgeInsets.all(5.0),
                                          //       child: Column(
                                          //         children: const [],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // const Divider(
                                          //   color: Colors.transparent,
                                          //   height: 20,
                                          // ),
                                          //
                                          // /// * offer type
                                          // SizedBox(
                                          //   height: 38,
                                          //   child: TextFormField(
                                          //     onTap: () {},
                                          //     style: const TextStyle(
                                          //         fontSize: 12,
                                          //         fontWeight: FontWeight.w400),
                                          //     decoration:
                                          //         textFormFieldFilterDecorationFilter(
                                          //             "Direct Sales/Job Order/Internal Order/ Maintenance Offer/ Project Offer/ Rent Offer",
                                          //             "Offer Type"),
                                          //   ),
                                          // ),
                                          // AnimatedContainer(
                                          //   duration: const Duration(seconds: 1),
                                          //   height: 0,
                                          //   child: SizedBox(
                                          //     height: 110,
                                          //     child: Padding(
                                          //       padding: const EdgeInsets.all(5.0),
                                          //       child: Column(
                                          //         children: [
                                          //           const Divider(
                                          //             color: Colors.transparent,
                                          //             height: 10,
                                          //           ),
                                          //           Expanded(
                                          //             child: ListView.builder(
                                          //               shrinkWrap: true,
                                          //               padding: EdgeInsets.zero,
                                          //               itemCount: 1,
                                          //               itemBuilder:
                                          //                   (context, index) {
                                          //                 return Padding(
                                          //                   padding:
                                          //                       const EdgeInsets
                                          //                               .only(
                                          //                           left: 5.0,
                                          //                           right: 5.0,
                                          //                           bottom: 5.0),
                                          //                   child: Column(
                                          //                     crossAxisAlignment:
                                          //                         CrossAxisAlignment
                                          //                             .start,
                                          //                     children: const [],
                                          //                   ),
                                          //                 );
                                          //               },
                                          //             ),
                                          //           )
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // const Divider(
                                          //   color: Colors.transparent,
                                          //   height: 20,
                                          // ),
                                          //
                                          // /// * product type
                                          // SizedBox(
                                          //   height: 38,
                                          //   child: TextFormField(
                                          //       onTap: () {},
                                          //       style: const TextStyle(
                                          //           fontSize: 12,
                                          //           fontWeight: FontWeight.w400),
                                          //       decoration:
                                          //           textFormFieldFilterDecorationFilter(
                                          //               "Standard/Special ",
                                          //               "Product type")),
                                          // ),
                                          // AnimatedContainer(
                                          //   duration: const Duration(seconds: 1),
                                          //   height: 0,
                                          //   child: SizedBox(
                                          //     height: 110,
                                          //     child: Padding(
                                          //       padding: const EdgeInsets.all(5.0),
                                          //       child: Column(
                                          //         children: [
                                          //           const Divider(
                                          //             color: Colors.transparent,
                                          //             height: 10,
                                          //           ),
                                          //           Expanded(
                                          //             child: ListView.builder(
                                          //               shrinkWrap: true,
                                          //               padding: EdgeInsets.zero,
                                          //               itemCount: 1,
                                          //               itemBuilder:
                                          //                   (context, index) {
                                          //                 return Padding(
                                          //                   padding:
                                          //                       const EdgeInsets
                                          //                               .only(
                                          //                           left: 5.0,
                                          //                           right: 5.0,
                                          //                           bottom: 5.0),
                                          //                   child: Column(
                                          //                     crossAxisAlignment:
                                          //                         CrossAxisAlignment
                                          //                             .start,
                                          //                     children: const [],
                                          //                   ),
                                          //                 );
                                          //               },
                                          //             ),
                                          //           )
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // const Divider(
                                          //   color: Colors.transparent,
                                          //   height: 20,
                                          // ),
                                          //
                                          // /// * Purchased Products YTD
                                          // SizedBox(
                                          //   width: 280,
                                          //   height: 60,
                                          //   child: Stack(
                                          //     alignment: Alignment.topLeft,
                                          //     children: [
                                          //       Padding(
                                          //         padding: const EdgeInsets.only(
                                          //             top: 8.0),
                                          //         child: InkWell(
                                          //           onTap: () {},
                                          //           highlightColor:
                                          //               Colors.transparent,
                                          //           hoverColor: Colors.transparent,
                                          //           splashColor: Colors.transparent,
                                          //           focusColor: Colors.transparent,
                                          //           child: Container(
                                          //             height: 60,
                                          //             decoration: BoxDecoration(
                                          //                 border: Border.all(
                                          //                   color: Colors.grey
                                          //                       .withOpacity(0.25),
                                          //                   width: 1.0,
                                          //                 ),
                                          //                 borderRadius: const BorderRadius
                                          //                         .only(
                                          //                     topRight: const Radius
                                          //                         .circular(5.0),
                                          //                     bottomLeft:
                                          //                         const Radius
                                          //                                 .circular(
                                          //                             5.0),
                                          //                     bottomRight:
                                          //                         const Radius
                                          //                                 .circular(
                                          //                             5.0))),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       Align(
                                          //         alignment: Alignment.topLeft,
                                          //         child: Padding(
                                          //           padding: const EdgeInsets.only(
                                          //               left: 4.0),
                                          //           child: Container(
                                          //             color: Colors.white,
                                          //             child: const Text(
                                          //               'Purchased Products YTD',
                                          //               style: TextStyle(
                                          //                   fontFamily:
                                          //                       AppFonts.ubuntu,
                                          //                   fontSize: 16,
                                          //                   fontWeight:
                                          //                       FontWeight.w900,
                                          //                   color: Colors.black54,
                                          //                   fontStyle:
                                          //                       FontStyle.italic),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                          //
                                          // AnimatedContainer(
                                          //   duration: const Duration(seconds: 1),
                                          //   height: 0,
                                          //   child: SizedBox(
                                          //     height: 300,
                                          //     child: Padding(
                                          //       padding: const EdgeInsets.all(5.0),
                                          //       child: Column(
                                          //         children: [
                                          //           TextFormField(),
                                          //           const Divider(
                                          //             color: Colors.transparent,
                                          //             height: 10,
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // const Divider(
                                          //   color: Colors.transparent,
                                          //   height: 20,
                                          // ),
                                          //
                                          // /// * Date
                                          // SizedBox(
                                          //   width: 280,
                                          //   height: 38,
                                          //   child: TextFormField(
                                          //       onTap: () {
                                          //         djp.expandedDatePicker(true);
                                          //       },
                                          //       style: const TextStyle(
                                          //           fontSize: 12,
                                          //           fontWeight:
                                          //               FontWeight.w400),
                                          //       decoration:
                                          //           textFormFieldFilterDecorationFilter(
                                          //         djp.filterDateController.text
                                          //                 .isEmpty
                                          //             ? djp.selectedFilteredDate
                                          //                 .toString()
                                          //             : djp.filterDateController
                                          //                 .text,
                                          //         "Entry Date",
                                          //       )),
                                          // ),
                                          // AnimatedContainer(
                                          //   constraints: djp.isDatePicker
                                          //       ? const BoxConstraints(
                                          //           maxHeight: 250)
                                          //       : const BoxConstraints(
                                          //           minHeight: 50,
                                          //           maxHeight: 250),
                                          //   decoration: BoxDecoration(
                                          //     color: Colors.white,
                                          //     border: Border.all(
                                          //         width: 1.8,
                                          //         color: AppColors.lightBlue),
                                          //     borderRadius:
                                          //         BorderRadius.circular(15),
                                          //   ),
                                          //   curve:
                                          //       Curves.easeInOutCubicEmphasized,
                                          //   duration:
                                          //       const Duration(seconds: 1),
                                          //   width: djp.isDatePicker ? 250 : 1,
                                          //   height: djp.isDatePicker ? null : 1,
                                          //   child: SfDateRangePicker(
                                          //     initialDisplayDate:
                                          //         DateTime.now(),
                                          //     enablePastDates: true,
                                          //     onSelectionChanged:
                                          //         djp.onFilterSelectionChanged,
                                          //     selectionMode:
                                          //         DateRangePickerSelectionMode
                                          //             .single,
                                          //   ),
                                          // ),
                                          const Divider(
                                            color: Colors.transparent,
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await djp.resetFilter();
                                          await djp
                                              .getDailyJournalEntryDateList(djp
                                                  .filterSearchKeyController
                                                  .text);
                                          await djp.getDailyJournalEntryPerDateList(
                                              searchKey: djp
                                                  .filterSearchKeyController
                                                  .text,
                                              dateToGetList: djp
                                                  .dailyJournalEntryDateModel
                                                  .dailyJournalEntryList[
                                                      djp.dateIndex]
                                                  .dateToGetList
                                                  .toString(),
                                              currentPage:
                                                  '${djp.entryJournalCurrentPage}',
                                              numberOfItemsPerPage:
                                                  '${djp.numberOfItemsPerPage}');

                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 55,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(17.5),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 4.0,
                                                right: 4.0,
                                                bottom: 4,
                                                top: 4),
                                            child: Center(
                                              child: Text(
                                                'Reset',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          // if (djp.dailyJournalEntryDateModel
                                          //             .result ==
                                          //         true &&
                                          //     djp
                                          //         .dailyJournalEntryDateModel
                                          //         .dailyJournalEntryList
                                          //         .isNotEmpty &&
                                          //     djp.dateIndex != -1) {
                                          await djp
                                              .resetDailyJournalEntryDate();
                                          await djp
                                              .resetDailyJournalEntryPerDate();
                                          djp.entryJournalCurrentPage = 1;
                                          await djp
                                              .getDailyJournalEntryDateList(djp
                                                  .filterSearchKeyController
                                                  .text);

                                          print('dateIndex ${djp.dateIndex}');
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 55,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(17.5),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 4.0,
                                                right: 4.0,
                                                bottom: 4,
                                                top: 4),
                                            child: Center(
                                              child: Text(
                                                'Find',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                    color: Colors.transparent, height: 10),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

InputDecoration textFormFieldFilterDecorationFilter(
    textTextLabelFormField, hintTextDirection) {
  return InputDecoration(
    hintText: textTextLabelFormField,
    hintStyle: const TextStyle(
      fontFamily: AppFonts.ubuntu,
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: Colors.black54,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: hintTextDirection,
    labelStyle: const TextStyle(
        fontFamily: AppFonts.ubuntu,
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: Colors.black54,
        fontStyle: FontStyle.italic),
    contentPadding: const EdgeInsets.only(left: 10, right: 10),
    suffix: const RotatedBox(
      quarterTurns: 1,
      child: Icon(
        Icons.search,
        color: Colors.black54,
        size: 13,
      ),
    ),
    enabledBorder: myEnableInputDecoration(),
    focusedBorder: myFocusInputDecoration(),
  );
}
