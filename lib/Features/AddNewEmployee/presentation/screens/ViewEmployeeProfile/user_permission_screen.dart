import 'dart:convert';

import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/providers/add_employee_provider.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/presentation/widgets/my_icon.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../widgets/check_box_with_text.dart';
import '../../widgets/styles.dart';

class UserPermissionScreen extends StatelessWidget {
  const UserPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, AddEmployeeProvider aep, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height * .15,
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.offWhite3,
                                                width: 1),
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 18,
                                        foregroundImage: aep.profileImage ==
                                                    null &&
                                                aep.base64Image == null
                                            ? const AssetImage(
                                                'assets/images/profile.png',
                                              )
                                            : kIsWeb
                                                ? MemoryImage(base64
                                                    .decode(aep.base64Image!))
                                                : FileImage(aep.profileImage!)
                                                    as ImageProvider,
                                      ),
                                    ],
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 7,
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: AppColors.appGreen,
                                    radius: 5,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Rogena FahmyOffice Manager',
                                style: TextStyle(
                                    fontFamily: UbuntuFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Row(
                                    children: [
                                      myIcon(
                                          prefixIconImage:
                                              'assets/images/building.png',
                                          size: 23),
                                      const SizedBox(width: 6),
                                      const Text(
                                        'Management@system.com',
                                        style: TextStyle(
                                            fontFamily: UbuntuFont,
                                            fontSize: 14,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5.0, top: 4),
                                  child: Row(
                                    children: const [
                                      Text(
                                        '@',
                                        style: TextStyle(
                                            fontFamily: UbuntuFont,
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Management@system.com',
                                        style: TextStyle(
                                            fontFamily: UbuntuFont,
                                            fontSize: 14,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                CheckBoxWithText(
                                  onTap: () {},
                                  text: 'Is Active',
                                  status: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'View Permission',
                    style: headerStyle,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              SizedBox(
                height: context.height * .6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: context.width < 1024
                            ? 2
                            : context.width < 1300
                                ? 3
                                : 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'All Roles',
                              style: headerStyle,
                            ),
                            Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    _buildRoleItem(context),
                                itemCount: 60,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: context.width < 1000
                                            ? 1
                                            : context.width < 1300
                                                ? 2
                                                : 3,
                                        crossAxisSpacing: 5,
                                        mainAxisExtent: 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Groups Name',
                            style: headerStyle,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  _buildGroupsNameItem(context),
                              itemCount: 60,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

_buildRoleItem(BuildContext context) {
  return CheckBoxWithText(
    status: false,
    text: ' CreateAndManageDeliveryOrderAndReport',
    onTap: () {},
  );
}

_buildGroupsNameItem(BuildContext context) {
  return CheckBoxWithText(
    status: false,
    text: '  TechnicalMembers',
    onTap: () {},
  );
}
