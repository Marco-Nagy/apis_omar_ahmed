import 'package:apis_omar_ahmed/Features/AddNewEmployee/presentation/widgets/date_dropList.dart';
import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:apis_omar_ahmed/widgets/btn_widgets/bordered_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/themes/colors.dart';
import '../../providers/add_employee_provider.dart';
import '../../widgets/styles.dart';
import '../add_employee_header.dart';
import 'attachment_row.dart';

class EmployeeAttachmentScreen extends StatefulWidget {
  const EmployeeAttachmentScreen({Key? key}) : super(key: key);

  @override
  EmployeeAttachmentScreenState createState() =>
      EmployeeAttachmentScreenState();
}

class EmployeeAttachmentScreenState extends State<EmployeeAttachmentScreen> {
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
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          Text(
                                            'Employee Attachment',
                                            style: headerStyle,
                                          ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              children: [
                                                AttachmentRow(
                                                    title: 'Employee CV',
                                                    attacheFile: aep.employeeCV,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseEmployeeCV();
                                                    },
                                                    textController:
                                                        aep.employeeCVCtrl),
                                                AttachmentRow(
                                                    title:
                                                        'Graduation Certification',
                                                    attacheFile: aep
                                                        .graduationCertification,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseGraduationCertification();
                                                    },
                                                    textController: aep
                                                        .graduationCertificationCtrl),
                                                AttachmentRow(
                                                    title: 'National ID',
                                                    attacheFile: aep.nationalID,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseNationalID();
                                                    },
                                                    textController:
                                                        aep.nationalIDCtrl),
                                                AttachmentRow(
                                                    title: 'Birth Certificate',
                                                    attacheFile:
                                                        aep.birthCertificate,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseBirthCertificate();
                                                    },
                                                    textController: aep
                                                        .birthCertificateCtrl),
                                                AttachmentRow(
                                                    title: 'Criminal Record',
                                                    attacheFile:
                                                        aep.criminalRecord,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseCriminalRecord();
                                                    },
                                                    textController:
                                                        aep.criminalRecordCtrl),
                                                AttachmentRow(
                                                    title: 'Passport',
                                                    attacheFile: aep.passport,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenClosePassport();
                                                    },
                                                    textController:
                                                        aep.passportCtrl),
                                                AttachmentRow(
                                                    title: 'Driving License',
                                                    attacheFile:
                                                        aep.drivingLicense,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseDrivingLicense();
                                                    },
                                                    textController:
                                                        aep.drivingLicenseCtrl),
                                                AttachmentRow(
                                                    title:
                                                        'Social insurance Record',
                                                    attacheFile: aep
                                                        .socialInsuranceRecord,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseSocialInsuranceRecord();
                                                    },
                                                    textController: aep
                                                        .socialInsuranceRecordCtrl),
                                                AttachmentRow(
                                                    title: 'Medical Report',
                                                    attacheFile:
                                                        aep.medicalReport,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseMedicalReport();
                                                    },
                                                    textController:
                                                        aep.medicalReportCtrl),
                                                AttachmentRow(
                                                    title: 'Working License',
                                                    attacheFile:
                                                        aep.workingLicense,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseWorkingLicense();
                                                    },
                                                    textController:
                                                        aep.workingLicenseCtrl),
                                                AttachmentRow(
                                                    title:
                                                        'Syndicate Permission',
                                                    attacheFile:
                                                        aep.syndicatePermission,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseSyndicatePermission();
                                                    },
                                                    textController: aep
                                                        .syndicatePermissionCtrl),
                                                AttachmentRow(
                                                    title:
                                                        'Military Service Exemption Cert',
                                                    attacheFile: aep
                                                        .militaryServiceExemptionCert,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseMilitaryServiceExemptionCert();
                                                    },
                                                    textController: aep
                                                        .militaryServiceExemptionCertCtrl),
                                                AttachmentRow(
                                                    title:
                                                        'Other Certificates or Trainings',
                                                    attacheFile: aep
                                                        .otherCertificatesOrTrainings,
                                                    onChangedDate: () {},
                                                    onTap: () {
                                                      aep.onOpenCloseOtherCertificatesOrTrainings();
                                                    },
                                                    textController: aep
                                                        .otherCertificatesOrTrainingsCtrl),
                                                SizedBox(
                                                  height: aep
                                                          .syndicatePermissionIsOpen
                                                      ? 30
                                                      : aep.militaryServiceExemptionCertIsOpen
                                                          ? 90
                                                          : aep.otherCertificatesOrTrainingsIsOpen
                                                              ? 150
                                                              : 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
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
                              const SizedBox(height: 20)
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
                    child: aep.employeeCVIsOpen == true ||
                            aep.graduationCertificationIsOpen == true ||
                            aep.nationalIDIsOpen == true ||
                            aep.birthCertificateIsOpen == true ||
                            aep.criminalRecordIsOpen == true ||
                            aep.passportIsOpen == true ||
                            aep.drivingLicenseIsOpen == true ||
                            aep.socialInsuranceRecordIsOpen == true ||
                            aep.medicalReportIsOpen == true ||
                            aep.workingLicenseIsOpen == true ||
                            aep.syndicatePermissionIsOpen == true ||
                            aep.militaryServiceExemptionCertIsOpen == true ||
                            aep.otherCertificatesOrTrainingsIsOpen == true
                        ? InkWell(
                            onTap: () {
                              aep.closeAllEmployeeAttachmentsLists();
                            },
                            child: Expanded(child: Container()),
                          )
                        : Container(),
                  ),
                  Positioned(
                    top: context.height * .23,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep.employeeCVIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.employeeCVCtrl,
                                                    () => aep
                                                        .onOpenCloseEmployeeCV());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .31,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep
                                                  .graduationCertificationIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep
                                                        .graduationCertificationCtrl,
                                                    () => aep
                                                        .onOpenCloseGraduationCertification());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .39,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep.nationalIDIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.nationalIDCtrl,
                                                    () => aep
                                                        .onOpenCloseNationalID());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .47,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen:
                                                  aep.birthCertificateIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.birthCertificateCtrl,
                                                    () => aep
                                                        .onOpenCloseBirthCertificate());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .552,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep.criminalRecordIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.criminalRecordCtrl,
                                                    () => aep
                                                        .onOpenCloseCriminalRecord());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .633,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep.passportIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.passportCtrl,
                                                    () => aep
                                                        .onOpenClosePassport());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .712,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep.drivingLicenseIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.drivingLicenseCtrl,
                                                    () => aep
                                                        .onOpenCloseDrivingLicense());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .793,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep
                                                  .socialInsuranceRecordIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep
                                                        .socialInsuranceRecordCtrl,
                                                    () => aep
                                                        .onOpenCloseSocialInsuranceRecord());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .873,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep.medicalReportIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.medicalReportCtrl,
                                                    () => aep
                                                        .onOpenCloseMedicalReport());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * .953,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep.workingLicenseIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.workingLicenseCtrl,
                                                    () => aep
                                                        .onOpenCloseWorkingLicense());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * 1.034,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen:
                                                  aep.syndicatePermissionIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep.syndicatePermissionCtrl,
                                                    () => aep
                                                        .onOpenCloseSyndicatePermission());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * 1.114,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep
                                                  .militaryServiceExemptionCertIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep
                                                        .militaryServiceExemptionCertCtrl,
                                                    () => aep
                                                        .onOpenCloseMilitaryServiceExemptionCert());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  Positioned(
                    top: context.height * 1.194,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 25.0,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          DateDropList(
                                              isOpen: aep
                                                  .otherCertificatesOrTrainingsIsOpen,
                                              onChange: (value) {
                                                aep.onDateSelectionChanged(
                                                    value,
                                                    aep
                                                        .otherCertificatesOrTrainingsCtrl,
                                                    () => aep
                                                        .onOpenCloseOtherCertificatesOrTrainings());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox())
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
