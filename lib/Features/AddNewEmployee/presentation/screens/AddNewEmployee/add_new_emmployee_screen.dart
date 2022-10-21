import 'dart:convert';

import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/AddNewEmployee/branch_dropList.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/widgets/btn_widgets/bordered_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/check_box_with_text.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../providers/add_employee_provider.dart';
import '../../widgets/styles.dart';
import '../add_employee_header.dart';
import 'department_dropList.dart';
import 'gender_dropList.dart';
import 'jopTitle_dropList.dart';

class AddNewEmployeeScreen extends StatefulWidget {
  const AddNewEmployeeScreen({Key? key}) : super(key: key);

  @override
  AddNewEmployeeScreenState createState() => AddNewEmployeeScreenState();
}

class AddNewEmployeeScreenState extends State<AddNewEmployeeScreen> {
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
                                          'Personal Information',
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
                                                      hintText: 'First Name',
                                                      labelText: 'First Name',
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
                                                      hintText: 'Middle Name',
                                                      labelText: 'Middle Name',
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
                                                      hintText: 'Last Name',
                                                      labelText: 'Last Name',
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
                                                      labelText: 'Branch',
                                                      hintText: 'Select Branch',
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
                                                      labelText: 'Gender',
                                                      hintText: 'Select Gender',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.genderCtrl,
                                                      onTap: () {
                                                        aep.onOpenCloseGender();
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
                                                      labelText: 'Age',
                                                      hintText: '0',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.ageCtrl,
                                                      onTap: () {},
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
                                                      labelText: 'Password',
                                                      hintText:
                                                          'Enter Password',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.passwordCtrl,
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 3,
                                                  child: SizedBox(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Contacts',
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
                                                      labelText: 'Email',
                                                      hintText: 'Enter Email',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.emailCtrl,
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
                                                      labelText: 'Mobile',
                                                      hintText: 'Enter Mobile',
                                                      onChanged: () {},
                                                      textController:
                                                          aep.mobileCtrl,
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
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CheckBoxWithText(
                                            onTap: () {},
                                            text: 'Is Active',
                                            status: false,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Center(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 80,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          AppColors.offWhite3,
                                                      width: 2),
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 75,
                                              foregroundImage: aep
                                                              .profileImage ==
                                                          null &&
                                                      aep.base64Image == null
                                                  ? const AssetImage(
                                                      'assets/images/profile.png',
                                                    )
                                                  : kIsWeb
                                                      ? MemoryImage(
                                                          base64.decode(
                                                              aep.base64Image!))
                                                      : FileImage(
                                                              aep.profileImage!)
                                                          as ImageProvider,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          const Expanded(child: SizedBox()),
                                          Expanded(
                                            flex: 2,
                                            child: BorderedButton(
                                              text: 'upload img',
                                              color: AppColors.lightBlue,
                                              onTap: () {
                                                aep.uploadProfileImage(
                                                  context: context,
                                                  offset: TapDownDetails()
                                                      .globalPosition,
                                                );
                                              },
                                            ),
                                          ),
                                          const Expanded(child: SizedBox()),
                                        ],
                                      ),
                                      SizedBox(height: context.height * .3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Expanded(
                                            flex: 1,
                                            child: SizedBox(),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: BorderedButton(
                                                    text: 'Cancel',
                                                    color: AppColors.appRed,
                                                    onTap: () {},
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Expanded(
                                                  child: BorderedButton(
                                                    text: 'Save',
                                                    color: AppColors.appGreen,
                                                    onTap: () {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
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
                  child: aep.branchIsOpen == true ||
                          aep.departmentIsOpen == true ||
                          aep.jopTitlesOpen == true ||
                          aep.genderIsOpen == true
                      ? InkWell(
                          onTap: () {
                            aep.closeAllDropDownList();
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
                          child: Row(
                            children: const [
                              Expanded(flex: 3, child: SizedBox()),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 4.0, right: 22),
                                  child: BranchDropList(),
                                ),
                              )
                            ],
                          )),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 240,
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
                                const EdgeInsets.only(left: 50.0, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.0, right: 9),
                                    child: DepartmentDropList(),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.0, right: 9),
                                    child: JopTitleDropList(),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 5.0, right: 8),
                                    child: GenderDropList(),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                          )),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
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
