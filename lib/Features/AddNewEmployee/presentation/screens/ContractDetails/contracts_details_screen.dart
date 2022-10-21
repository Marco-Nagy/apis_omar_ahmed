import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/ContractDetails/contractType_dropList.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/widgets/date_dropList.dart';
import 'package:apis_omar_ahmed/widgets/btn_widgets/bordered_btn.dart';
import 'package:apis_omar_ahmed/widgets/check_box_with_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../providers/add_employee_provider.dart';
import '../../widgets/styles.dart';
import '../add_employee_header.dart';

class ContractDetailsScreen extends StatefulWidget {
  const ContractDetailsScreen({Key? key}) : super(key: key);

  @override
  ContractDetailsScreenState createState() => ContractDetailsScreenState();
}

class ContractDetailsScreenState extends State<ContractDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AddEmployeeProvider aep, child) {
        return Scaffold(
          body: SafeArea(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Text(
                                          'Contract Details',
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
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: CustomTextField(
                                                      labelText:
                                                          'Contract Type',
                                                      hintText:
                                                          'Select Contract Type',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.contractTypeCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseContractType();
                                                      },
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
                                                          'Contract Start Date',
                                                      hintText:
                                                          'Select Start Date',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.startDateCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseStartDate();
                                                      },
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
                                                          'Contract End Date',
                                                      hintText:
                                                          'Select End Date',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.endDateCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseEndDate();
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
                                        const SizedBox(height: 10),
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
                                                          'Probation Period',
                                                      hintText:
                                                          'Enter Count of Months',
                                                      onChanged: () {},
                                                      textController: aep
                                                          .probationPeriodCtrl,
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
                                                          'Noticed By Employee',
                                                      hintText:
                                                          'Enter Count of Months',
                                                      onChanged: () {},
                                                      textController: aep
                                                          .noticedEmployeeCtrl,
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
                                                          'Noticed By Company',
                                                      hintText:
                                                          'Enter Count of Months',
                                                      onChanged: () {},
                                                      textController: aep
                                                          .noticedCompanyCtrl,
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                ),
                                                const Expanded(
                                                    child: SizedBox()),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    CheckBoxWithText(
                                                        text: 'Allow Over Time',
                                                        status: aep
                                                            .allowOverTimeChecked,
                                                        onTap: () {
                                                          aep.updateAllowOverTime();
                                                        }),
                                                    CheckBoxWithText(
                                                        text: 'Is Current ?',
                                                        status: false,
                                                        onTap: () {}),
                                                  ],
                                                ),
                                              ),
                                              if (aep.allowOverTimeChecked ==
                                                  true)
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      CheckBoxWithText(
                                                          text:
                                                              'Automatic as Per Working Hours and Time Sheet',
                                                          status: aep
                                                                  .overTimeTypeChecked ==
                                                              'Working Hours',
                                                          onTap: () {
                                                            aep.updateOverTimeType(
                                                                'Working Hours');
                                                          }),
                                                      CheckBoxWithText(
                                                          text:
                                                              'Manuel as per Provided Requests',
                                                          status: aep
                                                                  .overTimeTypeChecked ==
                                                              'Provided Requests',
                                                          onTap: () {
                                                            aep.updateOverTimeType(
                                                                'Provided Requests');
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                      ],
                                    ),
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
                  child: aep.startDateIsOpen == true ||
                          aep.endDateIsOpen == true ||
                          aep.contractTypeIsOpen == true
                      ? InkWell(
                          onTap: () {
                            aep.closeAllContractDetailsLists();
                          },
                          child: Container(),
                        )
                      : Container(),
                ),
                Positioned(
                  top: 180,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 0),
                                    margin: const EdgeInsets.only(left: 25),
                                    child: const ContractTypeDropList(),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    margin: const EdgeInsets.only(left: 9),
                                    child: DateDropList(
                                        isOpen: aep.startDateIsOpen,
                                        onChange: (value) {
                                          aep.onDateSelectionChanged(
                                              value,
                                              aep.startDateCtrl,
                                              () => aep.onOpenCloseStartDate());
                                        }),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.only(right: 15),
                                      margin: const EdgeInsets.only(right: 2),
                                      child: DateDropList(
                                        isOpen: aep.endDateIsOpen,
                                        onChange: (value) {
                                          aep.onDateSelectionChanged(
                                              value,
                                              aep.endDateCtrl,
                                              () => aep.onOpenCloseEndDate());
                                        },
                                      )),
                                ),
                                const Expanded(
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
        );
      },
    );
  }
}
