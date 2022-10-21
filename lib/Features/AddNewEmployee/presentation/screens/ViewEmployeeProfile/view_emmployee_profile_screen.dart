import 'dart:convert';

import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/ViewEmployeeProfile/othetButton_dropList.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/screens/ViewEmployeeProfile/user_permission_screen.dart';
import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/widgets/borderd_btn_with_icon.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/my_icon.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/utilities/constants.dart';
import 'package:apis_omar_ahmed/widgets/btn_widgets/bordered_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../widgets/check_box_with_text.dart';
import '../../providers/add_employee_provider.dart';
import '../../widgets/my_field_detail.dart';
import '../../widgets/styles.dart';

class ViewEmployeeProfileScreen extends StatefulWidget {
  const ViewEmployeeProfileScreen({Key? key}) : super(key: key);

  @override
  ViewEmployeeProfileScreenState createState() =>
      ViewEmployeeProfileScreenState();
}

class ViewEmployeeProfileScreenState extends State<ViewEmployeeProfileScreen> {
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
                            Container(
                              height: 40,
                              margin: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'View Employee Profile',
                                        style: webTitleStyle,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: context.width > 1024 ? 2 : 1,
                                      child: SizedBox()),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: BorderedButton(
                                              text: 'Profile Employee',
                                              color: AppColors.appBlue,
                                              onTap: () {
                                                aep.navigateTo(
                                                    'Profile Employee');
                                              }),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          flex: 4,
                                          child: BorderedButton(
                                              text: 'User Permission',
                                              color: AppColors.appBlue,
                                              onTap: () {
                                                aep.navigateTo(
                                                    'User Permission');
                                              }),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          flex: 4,
                                          child: BorderedButton(
                                              text: 'Go To List Employee',
                                              color: AppColors.appBlue,
                                              onTap: () {}),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          flex: 2,
                                          child: BorderedButton(
                                              text: 'Edit',
                                              color: AppColors.orange,
                                              onTap: () {}),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          flex: 3,
                                          child: BorderedButtonWithIcon(
                                            text: 'Other',
                                            color: AppColors.appBlue,
                                            onTap: () {
                                              aep.onOpenCloseOther();
                                            },
                                            widget: myIcon(
                                                prefixIconImage:
                                                    'assets/icons/arrow_down_ico.png',
                                                color: AppColors.appBlue,
                                                size: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            if (aep.currentScreen == 'Profile Employee')
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                                      child: myFieldDetail(
                                                          'First Name',
                                                          'A System'),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                        'Middle Name',
                                                        'System',
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                        'Last Name',
                                                        'System',
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                        'Branch',
                                                        'Alexandria',
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
                                                      child: myFieldDetail(
                                                        'Department',
                                                        'Management',
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                        'Job Title',
                                                        '.',
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                        'Gender',
                                                        'Male',
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                        'Age',
                                                        '1',
                                                      ),
                                                    ),
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
                                                      child: myFieldDetail(
                                                        'Email',
                                                        'system@system.com',
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: myFieldDetail(
                                                        'Mobile',
                                                        '0120',
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
                                                            base64.decode(aep
                                                                .base64Image!))
                                                        : FileImage(aep
                                                                .profileImage!)
                                                            as ImageProvider,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            if (aep.currentScreen == 'User Permission')
                              const UserPermissionScreen(),
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
                  child: aep.otherIsOpen == true
                      ? InkWell(
                          onTap: () {
                            aep.closeAllDropDownList();
                          },
                          child: Container(),
                        )
                      : Container(),
                ),
                Positioned(
                  top: 50,
                  bottom: 0,
                  left: 0,
                  right: 15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(flex: 6, child: SizedBox()),
                      Expanded(
                        flex: 1,
                        child: OtherButtonDropList(),
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
