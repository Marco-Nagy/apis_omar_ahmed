import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/decoration_widgets.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/fonts.dart';
import '../../../../../utilities/constants.dart';
import '../../widgets/my_icon.dart';
import '../JournalEntryView/adjusting_entries_view.dart';

class AdjustingEntry extends StatefulWidget {
  const AdjustingEntry(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<AdjustingEntry> createState() => _AdjustingEntryState();
}

class _AdjustingEntryState extends State<AdjustingEntry> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = -2;
    return Consumer(
      builder: (context, DailyJournalProvider djp, child) {
        return SizedBox(
          height: context.height / 1.55,
          // width: context.width / 3,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SizedBox(
                            width: context.width / 8.5,
                            child: title(title: 'from \\ To Account'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          width: context.width / 13,
                          height: 30,
                          decoration: myBoxDecoration(),
                          child: Center(
                            child: Text(
                              djp.fromAccountEntryList.isNotEmpty
                                  ? djp
                                      .formatter(djp.totalCreditAmount)
                                      .toString()
                                  : '',
                              style: const TextStyle(
                                  color: AppColors.textDarkGrey,
                                  fontSize: 14,
                                  fontFamily: AppFonts.ubuntu,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: context.width / 45),
                            child: title(title: 'Credit')),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          width: context.width / 13,
                          height: 30,
                          decoration: myBoxDecoration(),
                          child: Center(
                            child: Text(
                              djp.fromAccountEntryList.isNotEmpty
                                  ? djp
                                      .formatter(djp.totalDebitAmount)
                                      .toString()
                                  : '',
                              style: const TextStyle(
                                  color: AppColors.textDarkGrey,
                                  fontSize: 14,
                                  fontFamily: AppFonts.ubuntu,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: context.width / 45),
                            child: title(title: 'Debit')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: context.width / 2.5,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          title(title: 'Other'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 50,
                          child: MaterialButton(
                              padding: EdgeInsets.zero,
                              shape: updateButtonInputDecoration(),
                              onPressed: () async {},
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: AppFonts.ubuntu,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appBlue),
                              )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 30,
                          child: FloatingActionButton(
                            onPressed: () async {},
                            child: myIcon(
                                prefixIconImage: 'assets/icons/go_submit.png',
                                //color: Colors.white,
                                size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: djp.fromAccountEntryList.length,
                  itemBuilder: (context, index) {
                    selectedIndex = index;
                    var item = djp.fromAccountEntryList[index];
                    return djp.indexOfAdjustEntry != index
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  /// * AccountName
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      constraints: const BoxConstraints(
                                        minHeight: 30,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              '${index + 1}- ${djp.fromAccountEntryList[index]['accountName'].toString()}',
                                              style: const TextStyle(
                                                fontFamily: AppFonts.kaff,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                              color: AppColors.hintText,
                                              thickness: 1),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// * Credit Amounts
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        constraints: const BoxConstraints(
                                          minHeight: 30,
                                        ),
                                        child: Column(children: [
                                          djp.fromAccountEntryList[index]
                                                          ['accountType'] ==
                                                      'Credit' &&
                                                  djp.fromAccountEntryList[
                                                          index]['increase'] ==
                                                      true
                                              ? getAmount(index)
                                              : djp.fromAccountEntryList[index]
                                                              ['accountType'] ==
                                                          'Debit' &&
                                                      djp.fromAccountEntryList[
                                                                  index]
                                                              ['increase'] ==
                                                          false
                                                  ? getAmount(index)
                                                  : const SizedBox(),
                                        ])),
                                  ),

                                  /// * Debit Amounts
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(children: [
                                          djp.fromAccountEntryList[index]
                                                          ['accountType'] ==
                                                      'Debit' &&
                                                  djp.fromAccountEntryList[
                                                          index]['increase'] ==
                                                      true
                                              ? getAmount(index)
                                              : djp.fromAccountEntryList[index]
                                                              ['accountType'] ==
                                                          'Credit' &&
                                                      djp.fromAccountEntryList[
                                                                  index]
                                                              ['increase'] ==
                                                          false
                                                  ? getAmount(index)
                                                  : const SizedBox(),
                                        ])),
                                  ),

                                  // /// *Others
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      constraints: const BoxConstraints(
                                        minHeight: 30,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MaterialApp(
                                            debugShowCheckedModeBanner: false,
                                            scrollBehavior:
                                                MyCustomScrollBehavior(),
                                            builder: (context, child) {
                                              return DefaultTextStyle(
                                                style: const TextStyle(
                                                    decoration:
                                                        TextDecoration.none),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: [
                                                      otherText(
                                                        djp.fromAccountEntryList[
                                                                index]['type']
                                                            .toString(),
                                                      ),
                                                      otherText(
                                                        djp.fromAccountEntryList[
                                                                index]['client']
                                                            .toString(),
                                                      ),
                                                      otherText(
                                                        djp.fromAccountEntryList[
                                                                index]
                                                                ['project']
                                                            .toString(),
                                                      ),
                                                      otherText(
                                                        djp.fromAccountEntryList[
                                                                index]
                                                                ['costCenter']
                                                            .toString(),
                                                      ),
                                                      otherText(
                                                        djp.fromAccountEntryList[
                                                                index][
                                                                'paymentMethod']
                                                            .toString(),
                                                      ),
                                                      otherText(
                                                        djp.fromAccountEntryList[
                                                                index][
                                                                'beneficiaryType']
                                                            .toString(),
                                                      ),
                                                      otherText(
                                                        djp.fromAccountEntryList[
                                                                index][
                                                                'beneficiaryName']
                                                            .toString(),
                                                      ),
                                                      otherText(
                                                        djp.fromAccountEntryList[
                                                                index]['person']
                                                            .toString(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          const Divider(
                                              color: AppColors.hintText,
                                              thickness: 1),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// * Edit

                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          constraints: const BoxConstraints(
                                            minHeight: 30,
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.zero,
                                                  width: 30,
                                                  height: 30,
                                                  child: MaterialButton(
                                                    shape:
                                                        myEnableInputDecoration(),
                                                    color: AppColors.borderGray,
                                                    onPressed: () async {
                                                      await djp
                                                          .updateAdjustEntryIndex(
                                                              index);
                                                      print(
                                                          'selectedIndex $selectedIndex');
                                                    },
                                                    child: myIcon(
                                                        prefixIconImage:
                                                            'assets/icons/go_next.png',
                                                        color: Colors.white,
                                                        size: 15),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: SizedBox(
                                                    width: 40,
                                                    child: MaterialButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shape:
                                                            editButtonInputDecoration(),
                                                        onPressed: () async {
                                                          await djp
                                                              .getSavedEntry(
                                                                  index);
                                                        },
                                                        child: const Text(
                                                          'Edit',
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontFamily:
                                                                  AppFonts
                                                                      .ubuntu,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: AppColors
                                                                  .orange),
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: SizedBox(
                                                    width: 40,
                                                    child: MaterialButton(
                                                        shape:
                                                            deleteButtonInputDecoration(),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onPressed: () async {
                                                          setState(() {});
                                                          await djp
                                                              .removeAccountEntry(
                                                                  index);
                                                          djp.clearData();
                                                        },
                                                        child: const FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                fontFamily:
                                                                    AppFonts
                                                                        .ubuntu,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .appRed),
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (item['type'] != '' ||
                                  item['project'] != '' ||
                                  item['paymentMethod'] != '')
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: AnimatedContainer(
                                    height: djp.adjustEntryIndex == index
                                        ? null
                                        : 0,
                                    width: double.infinity,
                                    constraints: djp.adjustEntryIndex == index
                                        ? const BoxConstraints(
                                            minHeight: 1, minWidth: 50)
                                        : const BoxConstraints(
                                            maxHeight: 150, minWidth: 1),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.8,
                                          color: AppColors.lightBlue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    duration: const Duration(milliseconds: 1),
                                    child: Container(
                                      height: djp.adjustEntryIndex == index
                                          ? null
                                          : 0,
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 1),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          item['type'] == ""
                                              ? const SizedBox()
                                              : item['type'] == 'From Client' &&
                                                      item['client'] != ""
                                                  ? const SizedBox()
                                                  : item['type'] ==
                                                              'Purchasing(TO Supplier)' &&
                                                          item['supplier'] != ""
                                                      ? const SizedBox()
                                                      : otherDescription(
                                                          'Income Expenses Type :',
                                                          item['type'],
                                                          context),
                                          if (item['type'] == 'From Client')
                                            Row(
                                              children: [
                                                if (item['client'] != "")
                                                  otherDescription(
                                                      'Client Name :',
                                                      item['client'],
                                                      context),
                                                const SizedBox(width: 5),
                                                if (item['project'] != "")
                                                  otherDescription(
                                                      'Project Name :',
                                                      item['project'],
                                                      context),
                                              ],
                                            ),
                                          if (item['type'] ==
                                              'Purchasing(TO Supplier)')
                                            Row(
                                              children: [
                                                if (item['supplier'] != "")
                                                  otherDescription(
                                                      'Supplier Name :',
                                                      item['supplier'],
                                                      context),
                                                const SizedBox(width: 5),
                                                if (item['purchasePO'] != "")
                                                  otherDescription(
                                                      'PurchasePO Name :',
                                                      item['purchasePO'],
                                                      context),
                                              ],
                                            ),
                                          if (item['paymentMethod'] != '')
                                            otherDescription('Payment Method :',
                                                item['paymentMethod'], context),
                                          if (item['costCenter'] != '')
                                            otherDescription(
                                                'Cost Center Project Name :',
                                                item['costCenter'],
                                                context),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget otherText(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: AppFonts.kaff,
            fontSize: 12,
          ),
        ),
        text.isNotEmpty
            ? const Text(
                ' ,',
                style: TextStyle(
                  fontFamily: AppFonts.kaff,
                  fontSize: 12,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget getAmount(index) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            djp
                .formatter(
                    double.parse(djp.fromAccountEntryList[index]['amount']))
                .toString(),
            style: const TextStyle(
              fontFamily: AppFonts.kaff,
              fontSize: 12,
            ),
          ),
          Row(
            children: const [
              Expanded(child: Divider(color: AppColors.hintText, thickness: 1)),
              Text(
                'EGP ',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: AppFonts.ubuntu,
                  color: AppColors.appBlue,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ]);
      },
    );
  }
}
