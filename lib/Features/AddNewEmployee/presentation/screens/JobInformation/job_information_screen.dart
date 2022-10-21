import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/JobInformation/branch_dropList.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/JobInformation/reportsTo_dropList.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/JobInformation/team_dropList.dart';
import 'package:apis_omar_ahmed/widgets/btn_widgets/bordered_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../providers/add_employee_provider.dart';
import '../../widgets/styles.dart';
import '../add_employee_header.dart';
import 'department_dropList.dart';
import 'jopTitle_dropList.dart';

class JobInformationScreen extends StatefulWidget {
  const JobInformationScreen({Key? key}) : super(key: key);

  @override
  JobInformationScreenState createState() => JobInformationScreenState();
}

class JobInformationScreenState extends State<JobInformationScreen> {
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Job Information',
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
                                                  flex: 2,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: CustomTextField(
                                                      labelText: 'Job Title',
                                                      hintText:
                                                          'Select Job Title',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.jobTitleCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseJopTitle();
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
                                                          'Company Branch /Office',
                                                      hintText:
                                                          'Select Company Branch /Office',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.branchCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseBranch();
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
                                                      labelText: 'Department',
                                                      hintText:
                                                          'Select Department',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.departmentCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseDepartment();
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
                                                      labelText: 'Reports To',
                                                      hintText:
                                                          'Select Reports To',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.reportsToCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseReportsTo();
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
                                                      labelText: 'Team',
                                                      hintText:
                                                          '-- Select Team --',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.teamCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseTeam();
                                                        print(aep.teamIsOpen);
                                                      },
                                                    ),
                                                  ),
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
                                                          'User Company Email',
                                                      hintText: '',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.firstNameCtrl,
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
                                                          'User Company Landline',
                                                      hintText: '',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.middleNameCtrl,
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
                                                          'User Company Mobile',
                                                      hintText: '',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.lastNameCtrl,
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
                                                          'User Company Fax',
                                                      hintText: '',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.branchCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseBranch();
                                                      },
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
                            Row(
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
                  child: aep.branchIsOpen == true ||
                          aep.departmentIsOpen == true ||
                          aep.jopTitlesOpen == true ||
                          aep.reportsToIsOpen == true ||
                          aep.teamIsOpen == true
                      ? InkWell(
                          onTap: () {
                            aep.closeAllJobInfoLists();
                          },
                          child: Container(),
                        )
                      : Container(),
                ),
                Positioned(
                  top: 145,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 45.0, right: 40),
                        child: Row(
                          children: const [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0, right: 5),
                                child: JopTitleDropList(),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0, right: 5),
                                child: BranchDropList(),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0, right: 5),
                                child: DepartmentDropList(),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 5),
                                child: ReportsToDropList(),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8),
                                child: TeamDropList(),
                              ),
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
