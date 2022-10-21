import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/models/DailyJournalEntryDataInfoModel.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/my_scrollableText.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/fonts.dart';
import '../../../../../utilities/constants.dart';
import '../../widgets/decoration_widgets.dart';
import '../../widgets/my_icon.dart';

class AdjustEntriesView extends StatefulWidget {
  const AdjustEntriesView({Key? key}) : super(key: key);

  @override
  State<AdjustEntriesView> createState() => AdjustEntriesViewState();
}

class AdjustEntriesViewState extends State<AdjustEntriesView> {
  @override
  Widget build(BuildContext context) {
    EntryAccountList item;
    return Consumer(
      builder: (context, DailyJournalProvider djp, child) {
        return SizedBox(
          height: context.height / 1.55,
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
                          child: title(title: 'from \\ To Account'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 30,
                          decoration: myBoxDecoration(),
                          child: Center(
                            child: Text(
                              djp.entryAccountList.isNotEmpty
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
                          padding: const EdgeInsets.all(5),
                          height: 30,
                          decoration: myBoxDecoration(),
                          child: Center(
                            child: Text(
                              djp.entryAccountList.isNotEmpty
                                  ? djp
                                      .formatter(djp.totalDebitAmount.abs())
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
                    flex: 4,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        title(title: 'Other'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: djp.entryAccountList.length,
                  itemBuilder: (context, index) {
                    item = djp.entryAccountList[index];
                    return Column(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myScrollableText(Text(
                                      '${index + 1}- ${item.accountName}',
                                      style: const TextStyle(
                                        fontFamily: AppFonts.kaff,
                                        fontSize: 12,
                                      ),
                                    )),
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
                                  padding: const EdgeInsets.all(5),
                                  constraints: const BoxConstraints(
                                    minHeight: 30,
                                  ),
                                  child: item.accountTypeName == 'Credit' &&
                                          item.signOfAccount == 'plus'
                                      ? getAmount(index)
                                      : item.accountTypeName == 'Debit' &&
                                              item.signOfAccount == 'minus'
                                          ? getAmount(index)
                                          : const SizedBox()),
                            ),

                            /// * Debit Amounts
                            Expanded(
                              flex: 1,
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: item.accountTypeName == 'Debit' &&
                                          item.signOfAccount == 'plus'
                                      ? getAmount(index)
                                      : item.accountTypeName == 'Credit' &&
                                              item.signOfAccount == 'minus'
                                          ? getAmount(index)
                                          : const SizedBox()),
                            ),

                            // /// *Others
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                constraints: const BoxConstraints(
                                  minHeight: 30,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MaterialApp(
                                      debugShowCheckedModeBanner: false,
                                      scrollBehavior: MyCustomScrollBehavior(),
                                      builder: (context, child) {
                                        return DefaultTextStyle(
                                          style: const TextStyle(
                                              decoration: TextDecoration.none),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                otherText(
                                                  djp.dailyJournalEntryDataInfoModel
                                                      .data.creationUser,
                                                ),
                                                otherText(item.incOrExTypeName),
                                                otherText(
                                                  item.clinetName,
                                                ),
                                                otherText(
                                                  item.projectName,
                                                ),
                                                otherText(
                                                  '${djp.dailyJournalEntryDataInfoModel.data.costCenter.projectName} ${djp.dailyJournalEntryDataInfoModel.data.costCenter.costCenterAmount} ',
                                                ),
                                                otherText(
                                                  item.methodTypeName,
                                                ),
                                                otherText(
                                                  djp
                                                      .dailyJournalEntryDataInfoModel
                                                      .data
                                                      .beneficiaryToUser
                                                      .beneficiaryType,
                                                ),
                                                otherText(
                                                  djp
                                                      .dailyJournalEntryDataInfoModel
                                                      .data
                                                      .beneficiaryToUser
                                                      .assignBeneficiaryName,
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
                              flex: 0,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                //width: context.width / 8,
                                constraints: const BoxConstraints(
                                    minHeight: 30, minWidth: 30),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.zero,
                                      width: 30,
                                      height: 30,
                                      child: MaterialButton(
                                        shape: myEnableInputDecoration(),
                                        color: AppColors.borderGray,
                                        onPressed: () async {
                                          await djp.updateAdjustEntryViewIndex(
                                              index);
                                        },
                                        child: myIcon(
                                            prefixIconImage:
                                                'assets/icons/go_next.png',
                                            color: Colors.white,
                                            size: 15),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      width: 40,
                                      child: MaterialButton(
                                          padding: EdgeInsets.zero,
                                          shape: editButtonInputDecoration(),
                                          onPressed: () async {},
                                          child: const FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Edit',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontStyle: FontStyle.italic,
                                                  fontFamily: AppFonts.ubuntu,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.orange),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (item.incOrExTypeName != '' ||
                            item.projectName != '' ||
                            item.methodTypeName != '')
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AnimatedContainer(
                                    height: djp.selectedAdjustEntryView == index
                                        ? null
                                        : 0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.8,
                                          color: AppColors.lightBlue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    duration: const Duration(milliseconds: 1),
                                    child: Container(
                                      height:
                                          djp.selectedAdjustEntryView == index
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
                                          item.incOrExTypeName == ""
                                              ? const SizedBox()
                                              : item.incOrExTypeName ==
                                                          'From Client' &&
                                                      item.clinetName != ""
                                                  ? const SizedBox()
                                                  : item.incOrExTypeName ==
                                                              'Purchasing(TO Supplier)' &&
                                                          item.supplierName !=
                                                              ""
                                                      ? const SizedBox()
                                                      : otherDescription(
                                                          'Income Expenses Type :',
                                                          item.incOrExTypeName,
                                                          context),
                                          if (item.incOrExTypeName ==
                                              'From Client')
                                            Row(
                                              children: [
                                                if (item.clinetName != "")
                                                  otherDescription(
                                                      'Client Name :',
                                                      item.clinetName,
                                                      context),
                                                const SizedBox(width: 5),
                                                if (item.projectName != "")
                                                  otherDescription(
                                                      'Project Name :',
                                                      item.projectName,
                                                      context),
                                              ],
                                            ),
                                          if (item.incOrExTypeName ==
                                              'Purchasing(TO Supplier)')
                                            Row(
                                              children: [
                                                if (item.supplierName != "")
                                                  otherDescription(
                                                      'Supplier Name :',
                                                      item.supplierName,
                                                      context),
                                                const SizedBox(width: 5),
                                                if (item.purchasePOName != "")
                                                  otherDescription(
                                                      'PurchasePO Name :',
                                                      item.purchasePOName,
                                                      context),
                                              ],
                                            ),
                                          if (item.methodTypeName != '')
                                            otherDescription('Payment Method :',
                                                item.methodTypeName, context),
                                          // if (djp
                                          //     .dailyJournalEntryDataInfoModel
                                          //     .data
                                          //     .costCenter
                                          //     .projectName
                                          //     .isNotEmpty)
                                          otherDescription(
                                              'Cost Center Project Name :',
                                              'djp.dailyJournalEntryDataInfoModel.data.costCenter.projectName',
                                              context),
                                          // if (djp
                                          //         .dailyJournalEntryDataInfoModel
                                          //         .data
                                          //         .costCenter
                                          //         .costCenterAmount !=
                                          //     '')
                                          otherDescription(
                                              'Cost Center Amount :',
                                              ' djp.dailyJournalEntryDataInfoModel.data.costCenter.costCenterAmount',
                                              context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
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
        maxLines: 1,
      ),
      text != ""
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

Widget otherDescription(
    String title, String description, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: SizedBox(
      height: 20,
      width: MediaQuery.of(context).size.width * 0.28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.ubuntu,
              fontStyle: FontStyle.italic,
              color: AppColors.textTitle,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: myScrollableText(Text(
              description,
              style: const TextStyle(
                color: AppColors.textDarkGrey,
                fontSize: 14,
                fontFamily: AppFonts.ubuntu,
                fontWeight: FontWeight.w700,
              ),
            )),
          ),
        ],
      ),
    ),
  );
}

Widget getAmount(index) {
  return Consumer<DailyJournalProvider>(
    builder: (context, djp, child) {
      var item =
          djp.dailyJournalEntryDataInfoModel.data.entryAccountList[index];
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            djp.formatter(double.parse(item.amount).abs()).toString(),
            style: const TextStyle(
              fontFamily: AppFonts.kaff,
              fontSize: 12,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: [
            const Expanded(
                flex: 3,
                child: Divider(color: AppColors.hintText, thickness: 1)),
            Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  item.currencyName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontFamily: AppFonts.ubuntu,
                    color: AppColors.appBlue,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ]);
    },
  );
}

Widget title({required String title}) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.ubuntu,
        fontStyle: FontStyle.italic,
        color: AppColors.textTitle,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
