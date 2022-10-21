import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/SalaryDetails/allowance_type_dropList.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/SalaryDetails/currency_dropList.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/SalaryDetails/salaryMethod_dropList.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/utilities/constants.dart';
import 'package:apis_omar_ahmed/widgets/btn_widgets/bordered_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/check_box_with_text.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../providers/add_employee_provider.dart';
import '../../widgets/my_field_detail.dart';
import '../../widgets/styles.dart';
import '../add_employee_header.dart';
import 'salaryType_dropList.dart';

class SalaryDetailsScreen extends StatefulWidget {
  const SalaryDetailsScreen({Key? key}) : super(key: key);

  @override
  SalaryDetailsScreenState createState() => SalaryDetailsScreenState();
}

class SalaryDetailsScreenState extends State<SalaryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AddEmployeeProvider aep, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addEmployeeHeader(context),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Salary Details & Financial Terms',
                                            style: headerStyle,
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            height: 60,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: CustomTextField(
                                                        labelText:
                                                            'Salary Type',
                                                        hintText:
                                                            'Select Salary Type',
                                                        onChanged: () {},
                                                        textController:
                                                            aep.jobTitleCtrl,
                                                        onTap: () {
                                                          aep.onOpenCloseSalaryType();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: CustomTextField(
                                                        labelText: 'Currency',
                                                        hintText:
                                                            'Select Currency',
                                                        onChanged: () {},
                                                        textController:
                                                            aep.currencyCtrl,
                                                        onTap: () {
                                                          aep.onOpenCloseCurrency();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    flex: 7,
                                                    child: SizedBox(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: CustomTextField(
                                                        labelText:
                                                            'Basic Salary',
                                                        hintText: '',
                                                        onChanged: () {},
                                                        textController:
                                                            aep.basicSalaryCtrl,
                                                        onTap: () {},
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: CustomTextField(
                                                        labelText:
                                                            'Variant Salary',
                                                        hintText: '',
                                                        onChanged: () {},
                                                        textController: aep
                                                            .variantSalaryCtrl,
                                                        onTap: () {},
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                          'Total Gross', '0'),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                        'Per Hour',
                                                        '0',
                                                      ),
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
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tax or Other Deductions',
                                            style: headerStyle,
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            height: aep.tax.length * 60,
                                            child: Expanded(
                                              child: ListView.builder(
                                                itemCount: aep.tax.length,
                                                itemBuilder: (context, index) =>
                                                    Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: SizedBox(
                                                    height: 60,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child:
                                                                CustomTextField(
                                                              labelText:
                                                                  'Deduction Tax Name',
                                                              hintText: aep.tax[
                                                                      index]
                                                                  ['taxName'],
                                                              onChanged: () {},
                                                              onTap: () {},
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child:
                                                                CustomTextField(
                                                              labelText:
                                                                  'Tax Percentage',
                                                              hintText: aep.tax[
                                                                      index][
                                                                  'taxPercentage'],
                                                              onChanged: () {},
                                                              onTap: () {},
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                            child: myFieldDetail(
                                                                'Tax Amount',
                                                                '${aep.taxAmount}'),
                                                          ),
                                                        ),
                                                        InkWell(
                                                            onTap: () async {
                                                              await aep
                                                                  .addTaxName();
                                                              await aep
                                                                  .clearTax();
                                                            },
                                                            child: index == 0
                                                                ? addButton
                                                                : InkWell(
                                                                    onTap: () {
                                                                      aep.removeTax(
                                                                          index);
                                                                    },
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/img/xIcon.png',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      height:
                                                                          30,
                                                                      width: 30,
                                                                    ),
                                                                  )),
                                                        const Expanded(
                                                          child: SizedBox(),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: CheckBoxWithText(
                                              onTap: () {
                                                aep.updateSocialInsurance();
                                              },
                                              text: 'Social Insurance',
                                              status:
                                                  aep.socialInsuranceChecked,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (aep.socialInsuranceChecked == true)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1,
                                                      style:
                                                          BorderStyle.solid)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 60,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                              child:
                                                                  CustomTextField(
                                                                labelText:
                                                                    'Employee Percent',
                                                                hintText: '',
                                                                onChanged:
                                                                    () {},
                                                                textController:
                                                                    aep.employeePercentageCtrl,
                                                                onTap: () {},
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                              child: myFieldDetail(
                                                                  'Employee Amount',
                                                                  ' '),
                                                            ),
                                                          ),
                                                          const Expanded(
                                                            child: SizedBox(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 60,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                              child:
                                                                  CustomTextField(
                                                                labelText:
                                                                    'Company Percent',
                                                                hintText: '',
                                                                onChanged:
                                                                    () {},
                                                                textController:
                                                                    aep.companyPercentageCtrl,
                                                                onTap: () {},
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                              child: myFieldDetail(
                                                                  'Company Amount',
                                                                  ' '),
                                                            ),
                                                          ),
                                                          const Expanded(
                                                            child: SizedBox(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: CheckBoxWithText(
                                                      onTap: () {
                                                        aep.updateMedicalInsurance();
                                                      },
                                                      text: 'Medical Insurance',
                                                      status: aep
                                                          .medicalInsuranceChecked,
                                                    ),
                                                  ),
                                                  if (aep.medicalInsuranceChecked ==
                                                      true)
                                                    SizedBox(
                                                      height: 60,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                                child:
                                                                    CustomTextField(
                                                                  labelText:
                                                                      'Coverage Percent',
                                                                  hintText: '',
                                                                  onChanged:
                                                                      () {},
                                                                  textController:
                                                                      aep.deductionTaxNameCtrl,
                                                                  onTap: () {},
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                                child:
                                                                    CustomTextField(
                                                                  labelText:
                                                                      'Max Amount',
                                                                  hintText: '',
                                                                  onChanged:
                                                                      () {},
                                                                  textController:
                                                                      aep.maxCoverageAmountCtrl,
                                                                  onTap: () {},
                                                                ),
                                                              ),
                                                            ),
                                                            const Expanded(
                                                              child: SizedBox(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: CheckBoxWithText(
                                  onTap: () {
                                    aep.updateAllowanceInsurance();
                                  },
                                  text: 'Allowances',
                                  status: aep.allowanceInsuranceChecked,
                                ),
                              ),
                              if (aep.allowanceInsuranceChecked == true)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                            style: BorderStyle.solid)),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 60,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: CustomTextField(
                                                          labelText:
                                                              'Allowances Type',
                                                          hintText:
                                                              'Select Allowances Type',
                                                          onChanged: () {},
                                                          textController: aep
                                                              .allowanceTypeCtrl,
                                                          onTap: () {
                                                            aep.onOpenCloseAllowancesType();
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    const Expanded(
                                                      flex: 2,
                                                      child: SizedBox(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: CheckBoxWithText(
                                                onTap: () {
                                                  aep.updateAllowanceType(
                                                      'Amount');
                                                },
                                                text: 'Amount',
                                                status:
                                                    aep.allowanceTypeChecked ==
                                                        'Amount',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: CheckBoxWithText(
                                                onTap: () {
                                                  aep.updateAllowanceType(
                                                      'Percentage');
                                                },
                                                text: 'Percentage',
                                                status:
                                                    aep.allowanceTypeChecked ==
                                                        'Percentage',
                                              ),
                                            ),
                                            if (aep.allowanceTypeChecked ==
                                                'Percentage')
                                              SizedBox(
                                                height: 60,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child:
                                                              CustomTextField(
                                                            labelText:
                                                                'Allowance Percent',
                                                            hintText: '',
                                                            onChanged: () {},
                                                            textController: aep
                                                                .allowancePercentageCtrl,
                                                            onTap: () {},
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: myFieldDetail(
                                                              'Allowance Amount',
                                                              '0'),
                                                        ),
                                                      ),
                                                      const Expanded(
                                                        child: SizedBox(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if (aep.allowanceTypeChecked ==
                                                'Amount')
                                              SizedBox(
                                                height: 60,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child:
                                                              CustomTextField(
                                                            labelText:
                                                                'Allowance Amount',
                                                            hintText: '',
                                                            onChanged: () {},
                                                            textController: aep
                                                                .allowanceAmountCtrl,
                                                            onTap: () {},
                                                          ),
                                                        ),
                                                      ),
                                                      const Expanded(
                                                        flex: 2,
                                                        child: SizedBox(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Positioned(
                                          top: 56,
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Row(
                                                children: const [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 10.0,
                                                      ),
                                                      child:
                                                          AllowancesTypeDropList(),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: SizedBox(),
                                                  ),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child:
                                              myFieldDetail('Total Net', '0'),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: myFieldDetail(
                                            'Total Income',
                                            '0',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: CustomTextField(
                                            labelText: 'Salary Method',
                                            hintText: 'Select Method',
                                            onChanged: () {},
                                            textController:
                                                aep.salaryMethodCtrl,
                                            onTap: () {
                                              aep.onOpenCloseASalaryMethod();
                                            },
                                          ),
                                        ),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: context.height * .33,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0, right: 0),
                                            child: Row(
                                              children: const [
                                                Expanded(
                                                  flex: 2,
                                                  child: SizedBox(),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 10.0,
                                                      right: 15,
                                                    ),
                                                    child:
                                                        SalaryMethodDropList(),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    BorderedButton(
                                      text: 'Cancel',
                                      color: AppColors.appRed,
                                      onTap: () {},
                                    ),
                                    const SizedBox(width: 5),
                                    BorderedButton(
                                      text: 'Save',
                                      color: AppColors.appGreen,
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: aep.currencyIsOpen == true ||
                            aep.allowancesTypeIsOpen == true ||
                            aep.salaryMethodIsOpen == true ||
                            aep.salaryTypeIsOpen == true
                        ? InkWell(
                            onTap: () {
                              aep.closeAllSalaryDetailsLists();
                            },
                            child: Container(),
                          )
                        : Container(),
                  ),
                  Positioned(
                    top: 143,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 45.0, right: 0),
                          child: Row(
                            children: const [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 15,
                                  ),
                                  child: SalaryTypeDropList(),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 22,
                                  ),
                                  child: CurrencyDropList(),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
