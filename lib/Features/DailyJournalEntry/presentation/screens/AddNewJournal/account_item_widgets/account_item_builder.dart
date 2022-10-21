import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/providers/daily_journal_provider.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/my_icon.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/fonts.dart';
import '../../../providers/daily_journal_provider.dart';
import '../../../widgets/decoration_widgets.dart';
import '../../../widgets/default_text_field.dart';
import '../../../widgets/my_scrollableText.dart';
import '../adjusting_entry.dart';
import 'account_name_widget.dart';
import 'client_widget.dart';
import 'cost_center_widget.dart';
import 'payment_method_widget.dart';
import 'person_widget.dart';
import 'project_widget.dart';
import 'purchasePO_widget.dart';
import 'supplier_widget.dart';
import 'type_widget.dart';

class AccountItemBuilder extends StatefulWidget {
  const AccountItemBuilder({Key? key}) : super(key: key);

  @override
  AccountItemBuilderState createState() => AccountItemBuilderState();
}

class AccountItemBuilderState extends State<AccountItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DailyJournalProvider>(
      builder: (context, djp, child) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  /// * from Acc __ Amount __ Increase.Decrease
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /// * From Account DropDown
                      const Expanded(flex: 2, child: AccountNameWidget()),

                      /// * AccountType - Amount - Currency
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            /// * AccountType
                            if (djp.accountNameCtrl.text.isNotEmpty)
                              Column(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      djp.accountType,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: AppFonts.ubuntu,
                                        color: AppColors.appBlue,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),

                            /// * Amount
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: dropDownTitle(title: 'Amount'),
                                    ),
                                    defaultTextField(
                                      height: 30,
                                      enabledBorder: myEnableInputDecoration(),
                                      focusedBorder: myFocusInputDecoration(),
                                      controller: djp.amountCtrl,
                                      isNumber: true,
                                      onTap: () {
                                        djp.amountCtrl.selection =
                                            TextSelection(
                                                baseOffset: 0,
                                                extentOffset:
                                                    djp.amountCtrl.text.length);
                                      },
                                      onChange: (amount) async {
                                        djp.setAmount(amount: amount);
                                      },
                                      type: TextInputType.number,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Enter Document Number";
                                        }
                                        return null;
                                      },
                                      prefixIcon: Icons.date_range,
                                      label: '',
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            /// * Currency
                            if (djp.accountNameCtrl.text.isNotEmpty)
                              Column(
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      djp.accountCurrency,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: AppFonts.ubuntu,
                                        color: AppColors.appBlue,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),

                      /// * Increase / Decrease
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                //! Plus Button
                                Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Column(
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: djp.increase ==
                                                              true
                                                          ? AppColors.appGreen
                                                          : Colors.white,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomLeft:
                                                            Radius.circular(25),
                                                        bottomRight:
                                                            Radius.circular(25),
                                                        topLeft:
                                                            Radius.circular(25),
                                                      ),
                                                      border: const Border(
                                                        bottom: BorderSide(
                                                            color: AppColors
                                                                .borderGray,
                                                            width: 2),
                                                        top: BorderSide(
                                                            color: AppColors
                                                                .borderGray,
                                                            width: 2),
                                                        right: BorderSide(
                                                            color: AppColors
                                                                .borderGray,
                                                            width: 2),
                                                        left: BorderSide(
                                                            color: AppColors
                                                                .borderGray,
                                                            width: 2),
                                                      ),
                                                    ),
                                                    child: IconButton(
                                                        onPressed: () async {
                                                          await djp
                                                              .updateIncrease(
                                                                  true);
                                                        },
                                                        icon: myIcon(
                                                            prefixIconImage:
                                                                'assets/icons/plus.png',
                                                            color:
                                                                djp.increase ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .grey,
                                                            size: 15)),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: myIcon(
                                                      prefixIconImage:
                                                          'assets/icons/arrow_up_ico.png',
                                                      color: djp.increase ==
                                                              true
                                                          ? AppColors.appGreen
                                                          : Colors.grey,
                                                      size: 20),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: djp.increase == null
                                      ? const Center(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Select type',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: AppFonts.ubuntu,
                                                color: AppColors.textDarkGrey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      : Center(
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Text(
                                              djp.accountType == 'Debit' &&
                                                      djp.increase == true
                                                  ? "Debit"
                                                  : djp.accountType ==
                                                              'Credit' &&
                                                          djp.increase == false
                                                      ? "Debit"
                                                      : "Credit",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: AppFonts.ubuntu,
                                                color: djp.increase == true
                                                    ? AppColors.appGreen
                                                    : djp.increase == false
                                                        ? AppColors.appRed
                                                        : Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                ),

                                //! Minus Button
                                Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: djp.increase == false
                                                        ? AppColors.appRed
                                                        : Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(25),
                                                      bottomRight:
                                                          Radius.circular(25),
                                                      topLeft:
                                                          Radius.circular(25),
                                                    ),
                                                    border: const Border(
                                                      bottom: BorderSide(
                                                          color: AppColors
                                                              .borderGray,
                                                          width: 2),
                                                      top: BorderSide(
                                                          color: AppColors
                                                              .borderGray,
                                                          width: 2),
                                                      right: BorderSide(
                                                          color: AppColors
                                                              .borderGray,
                                                          width: 2),
                                                      left: BorderSide(
                                                          color: AppColors
                                                              .borderGray,
                                                          width: 2),
                                                    ),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () async {
                                                      djp.updateIncrease(false);
                                                    },
                                                    icon: myIcon(
                                                        prefixIconImage:
                                                            'assets/icons/minus.png',
                                                        color: djp.increase ==
                                                                false
                                                            ? Colors.white
                                                            : AppColors
                                                                .textDarkGrey,
                                                        size: 20),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: myIcon(
                                                  prefixIconImage:
                                                      'assets/icons/arrow_down_ico.png',
                                                  color: djp.increase == false
                                                      ? AppColors.appRed
                                                      : AppColors.textDarkGrey,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // if (context.width > 1024)
                      const Expanded(flex: 3, child: SizedBox())
                    ],
                  ),
                  const SizedBox(height: 2),

                  /// * Type _ Client _ Project _ Supplier _  _ PurchasePo _ CostCenter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (djp.accountCategory == "Income" ||
                          djp.accountCategory == "Expenses")
                        const TypeWidget(),
                      if (djp.typeNameCtrl.text == "From Client")
                        const ClientWidget(),
                      const ProjectWidget(),
                      if (djp.typeNameCtrl.text == "Purchasing(TO Supplier)")
                        const SupplierWidget(),
                      const PurchasePOWidget(),
                      const CostCenterWidget(),
                    ],
                  ),
                  const SizedBox(height: 2),

                  /// * PaymentMethod __ Beneficiary __ Person
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Expanded(child: PaymentMethodWidget()),

                      /// * Beneficiary Type / Name Dropdown
                      // Expanded(
                      //   flex: 2,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       dropDownTitle(title: 'Beneficiary Type / Name'),
                      //       Row(
                      //         children: const [
                      //           BeneficiaryTypeWidget(),
                      //           BeneficiaryNameWidget(),
                      //         ],
                      //       ),
                      //       const SizedBox(
                      //         height: 10,
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      const Expanded(child: PersonWidget()),

                      /// * Add Attached __ Add Account
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              child: myIcon(
                                  prefixIconImage: 'assets/icons/check.png',
                                  size: 30),
                            ),
                            Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              child: myIcon(
                                  prefixIconImage:
                                      'assets/icons/info_green.png',
                                  size: 30),
                            ),
                            InkWell(
                              onTap: () {
                                djp.getFileLicenseForWeb();
                              },
                              child: myIcon(
                                  prefixIconImage:
                                      'assets/icons/personal_file_big.png',
                                  size: 40),
                            ),
                            const Spacer(),
                            djp.indexOfAdjustEntry != -1
                                ? FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: SizedBox(
                                              width: 40,
                                              height: 30,
                                              child: MaterialButton(
                                                  padding: EdgeInsets.zero,
                                                  shape:
                                                      updateButtonInputDecoration(),
                                                  onPressed: () async {
                                                    await djp.updateAccountEntry(
                                                        djp.indexOfAdjustEntry);

                                                    djp.clearData();
                                                  },
                                                  child: const FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      'update',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontFamily:
                                                              AppFonts.ubuntu,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .appBlue),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: SizedBox(
                                            width: 40,
                                            height: 30,
                                            child: MaterialButton(
                                                shape:
                                                    cancelButtonInputDecoration(),
                                                padding: EdgeInsets.zero,
                                                onPressed: () async {},
                                                child: const FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontFamily:
                                                            AppFonts.ubuntu,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.amber),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: FloatingActionButton(
                                      backgroundColor: AppColors.appGreen,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.padded,
                                      onPressed: () async {
                                        if (djp.accountNameCtrl.text
                                                .isNotEmpty &&
                                            djp.amountCtrl.text.isNotEmpty &&
                                            djp.increase != null) {
                                          await djp.addAccountEntry();
                                          await djp.clearData();
                                        }
                                      },
                                      child: myIcon(
                                          prefixIconImage:
                                              'assets/icons/plus.png',
                                          color: Colors.white,
                                          size: 15),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.appDarkRed, thickness: 1.5),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: AdjustingEntry(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //////////////////////////////////////////////////////////////////////
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: djp.selectedFromToAccountText == true ||
                      djp.selectedTypeText == true ||
                      djp.selectedClientText == true ||
                      djp.selectedProjectText == true ||
                      djp.selectedSupplierText == true ||
                      djp.selectedPurchasePOText == true ||
                      djp.selectedCostCenterText == true ||
                      djp.selectedPaymentMethodText == true ||
                      djp.selectedBeneficiaryNameText == true ||
                      djp.selectedBeneficiaryTypeText == true ||
                      djp.selectedPersonText == true
                  ? InkWell(
                      onTap: () {
                        djp.closeAllDropDownList();
                      },
                      child: Container(),
                    )
                  : Container(),
            ),
            Positioned(
              top: 60,
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: context.width * .045),
                        child: const FromToAccountDropList(),
                      )),
                  const Expanded(flex: 2, child: SizedBox()),
                ],
              ),
            ),
            Positioned(
              top: 125,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  if (djp.accountCategory == "Income" ||
                      djp.accountCategory == "Expenses")
                    const Expanded(child: TypeDropList()),
                  if (djp.typeNameCtrl.text == "From Client")
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 35.0),
                      child: ClientDropList(),
                    )),
                  if (djp.clientCtrl.text.isNotEmpty)
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 35.0),
                      child: ProjectDropList(),
                    )),
                  if (djp.typeNameCtrl.text == "Purchasing(TO Supplier)")
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 35.0),
                      child: SupplierDropList(),
                    )),
                  if (djp.supplierCtrl.text.isNotEmpty)
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(right: 35.0),
                      child: PurchasePODropList(),
                    )),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 35.0),
                    child: CostCenterDropList(),
                  )),
                ],
              ),
            ),
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              child: Row(
                children: const [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 35.0),
                    child: PaymentMethodDropList(),
                  )),
                  // const Expanded(child: SizedBox()),
                  // const Expanded(child: SizedBox()),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: PersonDropList(),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget dropDownItemBuilder(
    {required BuildContext context, required String item, String? itemNumber}) {
  return Container(
    height: 30,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    padding: const EdgeInsets.only(bottom: 5),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          itemNumber == null
              ? const SizedBox()
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      itemNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.ubuntu,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              item,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.ubuntu,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dropDownTextField({
  required GestureTapCallback onTap,
  required Widget widget,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 30,
      decoration: myBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          children: [
            Expanded(
              child: myScrollableText(
                widget,
              ),
            ),
            myIcon(
                prefixIconImage: 'assets/icons/arrow_down_ico.png',
                color: Colors.black,
                size: 15),
          ],
        ),
      ),
    ),
  );
}

Widget dropDownDescription({required String description}) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          description,
          style: const TextStyle(
            color: AppColors.lightBlack,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.ubuntu,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    ),
  );
}

Widget dropDownTitle({required String title}) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    child: Padding(
      padding: const EdgeInsets.only(left: 12.50),
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
    ),
  );
}
