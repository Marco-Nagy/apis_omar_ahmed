import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utilities/functions.dart';

class AddEmployeeProvider extends ChangeNotifier {
  /// * Controllers
  var firstNameCtrl = TextEditingController();
  var middleNameCtrl = TextEditingController();
  var lastNameCtrl = TextEditingController();
  var branchCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var mobileCtrl = TextEditingController();
  var departmentCtrl = TextEditingController();
  var jobTitleCtrl = TextEditingController();
  var genderCtrl = TextEditingController();
  var ageCtrl = TextEditingController();
  var dateCtrl = TextEditingController();
  var interviewerCtrl = TextEditingController();
  var positionCtrl = TextEditingController();
  var commentCtrl = TextEditingController();
  var userEmailCtrl = TextEditingController();
  var userMobileCtrl = TextEditingController();
  var userLandLineCtrl = TextEditingController();
  var userFaxCtrl = TextEditingController();
  var reportsToCtrl = TextEditingController();
  var teamCtrl = TextEditingController();
  var startDateCtrl = TextEditingController();
  var endDateCtrl = TextEditingController();
  var contractTypeCtrl = TextEditingController();
  var probationPeriodCtrl = TextEditingController();
  var noticedEmployeeCtrl = TextEditingController();
  var noticedCompanyCtrl = TextEditingController();
  var employeeCVCtrl = TextEditingController();
  var graduationCertificationCtrl = TextEditingController();
  var nationalIDCtrl = TextEditingController();
  var birthCertificateCtrl = TextEditingController();
  var criminalRecordCtrl = TextEditingController();
  var passportCtrl = TextEditingController();
  var drivingLicenseCtrl = TextEditingController();
  var socialInsuranceRecordCtrl = TextEditingController();
  var medicalReportCtrl = TextEditingController();
  var workingLicenseCtrl = TextEditingController();
  var syndicatePermissionCtrl = TextEditingController();
  var militaryServiceExemptionCertCtrl = TextEditingController();
  var otherCertificatesOrTrainingsCtrl = TextEditingController();
  var salaryTypeCtrl = TextEditingController();
  var currencyCtrl = TextEditingController();
  var basicSalaryCtrl = TextEditingController();
  var variantSalaryCtrl = TextEditingController();
  var deductionTaxNameCtrl = TextEditingController();
  var taxPercentageCtrl = TextEditingController();
  var employeePercentageCtrl = TextEditingController();
  var companyPercentageCtrl = TextEditingController();
  var coveragePercentageCtrl = TextEditingController();
  var maxCoverageAmountCtrl = TextEditingController();
  var allowanceTypeCtrl = TextEditingController();
  var salaryMethodCtrl = TextEditingController();
  var allowancePercentageCtrl = TextEditingController();
  var allowanceAmountCtrl = TextEditingController();

  /// * variables
  bool branchIsOpen = false;
  bool departmentIsOpen = false;
  bool jopTitlesOpen = false;
  bool genderIsOpen = false;
  bool otherIsOpen = false;
  bool dateIsOpen = false;
  bool startDateIsOpen = false;
  bool endDateIsOpen = false;
  bool interviewerIsOpen = false;
  bool positionIsOpen = false;
  bool reportsToIsOpen = false;
  bool teamIsOpen = false;
  bool contractTypeIsOpen = false;
  String fileTypeLicense = " ";
  String fileNameLicense = " ";
  List interviewFile = [];
  List employeeCV = [];
  List graduationCertification = [];
  List nationalID = [];
  List birthCertificate = [];
  List criminalRecord = [];
  List passport = [];
  List drivingLicense = [];
  List socialInsuranceRecord = [];
  List medicalReport = [];
  List workingLicense = [];
  List syndicatePermission = [];
  List militaryServiceExemptionCert = [];
  List otherCertificatesOrTrainings = [];
  bool employeeCVIsOpen = false;
  bool graduationCertificationIsOpen = false;
  bool nationalIDIsOpen = false;
  bool birthCertificateIsOpen = false;
  bool criminalRecordIsOpen = false;
  bool passportIsOpen = false;
  bool drivingLicenseIsOpen = false;
  bool socialInsuranceRecordIsOpen = false;
  bool medicalReportIsOpen = false;
  bool workingLicenseIsOpen = false;
  bool syndicatePermissionIsOpen = false;
  bool militaryServiceExemptionCertIsOpen = false;
  bool otherCertificatesOrTrainingsIsOpen = false;
  bool salaryTypeIsOpen = false;
  bool currencyIsOpen = false;
  bool allowancesTypeIsOpen = false;
  bool salaryMethodIsOpen = false;
  bool socialInsuranceChecked = false;
  bool medicalInsuranceChecked = false;
  bool allowanceInsuranceChecked = false;
  bool allowOverTimeChecked = false;
  String currentScreen = 'Profile Employee';
  String allowanceTypeChecked = 'Amount';
  String overTimeTypeChecked = 'Working Hours';
  double taxAmount = 0.0;
  List tax = [
    {
      'taxName': '',
      'taxPercentage': '',
      'taxAmount': 0.0,
    }
  ];

  /// * DropList Function

  onOpenCloseBranch() {
    branchIsOpen = !branchIsOpen;
    notifyListeners();
  }

  onOpenCloseDepartment() {
    departmentIsOpen = !departmentIsOpen;
    notifyListeners();
  }

  onOpenCloseJopTitle() {
    jopTitlesOpen = !jopTitlesOpen;
    notifyListeners();
  }

  onOpenCloseGender() {
    genderIsOpen = !genderIsOpen;
    notifyListeners();
  }

  onOpenCloseOther() {
    otherIsOpen = !otherIsOpen;
    notifyListeners();
  }

  onOpenCloseDate() {
    dateIsOpen = !dateIsOpen;
    notifyListeners();
  }

  onOpenCloseStartDate() {
    startDateIsOpen = !startDateIsOpen;
    notifyListeners();
  }

  onOpenCloseEndDate() {
    endDateIsOpen = !endDateIsOpen;
    notifyListeners();
  }

  onOpenCloseInterviewer() {
    interviewerIsOpen = !interviewerIsOpen;
    notifyListeners();
  }

  onOpenClosePosition() {
    positionIsOpen = !positionIsOpen;
    notifyListeners();
  }

  onOpenCloseReportsTo() {
    reportsToIsOpen = !reportsToIsOpen;
    notifyListeners();
  }

  onOpenCloseContractType() {
    contractTypeIsOpen = !contractTypeIsOpen;
    notifyListeners();
  }

  onOpenCloseTeam() {
    teamIsOpen = !teamIsOpen;
    notifyListeners();
  }

  onOpenCloseEmployeeCV() {
    employeeCVIsOpen = !employeeCVIsOpen;
    notifyListeners();
  }

  onOpenCloseGraduationCertification() {
    graduationCertificationIsOpen = !graduationCertificationIsOpen;
    notifyListeners();
  }

  onOpenCloseNationalID() {
    nationalIDIsOpen = !nationalIDIsOpen;
    notifyListeners();
  }

  onOpenCloseBirthCertificate() {
    birthCertificateIsOpen = !birthCertificateIsOpen;
    notifyListeners();
  }

  onOpenCloseCriminalRecord() {
    criminalRecordIsOpen = !criminalRecordIsOpen;
    notifyListeners();
  }

  onOpenClosePassport() {
    passportIsOpen = !passportIsOpen;
    notifyListeners();
  }

  onOpenCloseDrivingLicense() {
    drivingLicenseIsOpen = !drivingLicenseIsOpen;
    notifyListeners();
  }

  onOpenCloseSocialInsuranceRecord() {
    socialInsuranceRecordIsOpen = !socialInsuranceRecordIsOpen;
    notifyListeners();
  }

  onOpenCloseMedicalReport() {
    medicalReportIsOpen = !medicalReportIsOpen;
    notifyListeners();
  }

  onOpenCloseWorkingLicense() {
    workingLicenseIsOpen = !workingLicenseIsOpen;
    notifyListeners();
  }

  onOpenCloseSyndicatePermission() {
    syndicatePermissionIsOpen = !syndicatePermissionIsOpen;
    notifyListeners();
  }

  onOpenCloseMilitaryServiceExemptionCert() {
    militaryServiceExemptionCertIsOpen = !militaryServiceExemptionCertIsOpen;
    notifyListeners();
  }

  onOpenCloseOtherCertificatesOrTrainings() {
    otherCertificatesOrTrainingsIsOpen = !otherCertificatesOrTrainingsIsOpen;
    notifyListeners();
  }

  onOpenCloseSalaryType() {
    salaryTypeIsOpen = !salaryTypeIsOpen;
    notifyListeners();
  }

  onOpenCloseCurrency() {
    currencyIsOpen = !currencyIsOpen;
    notifyListeners();
  }

  onOpenCloseAllowancesType() {
    allowancesTypeIsOpen = !allowancesTypeIsOpen;
    notifyListeners();
  }

  onOpenCloseASalaryMethod() {
    salaryMethodIsOpen = !salaryMethodIsOpen;
    notifyListeners();
  }

  updateSocialInsurance() {
    socialInsuranceChecked = !socialInsuranceChecked;
    notifyListeners();
  }

  updateMedicalInsurance() {
    medicalInsuranceChecked = !medicalInsuranceChecked;
    notifyListeners();
  }

  updateAllowanceInsurance() {
    allowanceInsuranceChecked = !allowanceInsuranceChecked;
    notifyListeners();
  }

  updateAllowOverTime() {
    allowOverTimeChecked = !allowOverTimeChecked;
    notifyListeners();
  }

  updateAllowanceType(value) {
    allowanceTypeChecked = value;
    notifyListeners();
  }

  updateOverTimeType(value) {
    overTimeTypeChecked = value;
    notifyListeners();
  }

  closeAllDropDownList() {
    branchIsOpen = false;
    departmentIsOpen = false;
    jopTitlesOpen = false;
    genderIsOpen = false;
    otherIsOpen = false;
    notifyListeners();
  }

  closeAllInterviewDetailsLists() {
    dateIsOpen = false;
    interviewerIsOpen = false;
    positionIsOpen = false;
    notifyListeners();
  }

  closeAllJobInfoLists() {
    branchIsOpen = false;
    departmentIsOpen = false;
    jopTitlesOpen = false;
    reportsToIsOpen = false;
    teamIsOpen = false;
    notifyListeners();
  }

  closeAllContractDetailsLists() {
    contractTypeIsOpen = false;
    startDateIsOpen = false;
    endDateIsOpen = false;
    notifyListeners();
  }

  closeAllEmployeeAttachmentsLists() {
    employeeCVIsOpen = false;
    graduationCertificationIsOpen = false;
    nationalIDIsOpen = false;
    birthCertificateIsOpen = false;
    criminalRecordIsOpen = false;
    passportIsOpen = false;
    drivingLicenseIsOpen = false;
    socialInsuranceRecordIsOpen = false;
    medicalReportIsOpen = false;
    workingLicenseIsOpen = false;
    syndicatePermissionIsOpen = false;
    militaryServiceExemptionCertIsOpen = false;
    otherCertificatesOrTrainingsIsOpen = false;
    notifyListeners();
  }

  closeAllSalaryDetailsLists() {
    salaryTypeIsOpen = false;
    currencyIsOpen = false;
    allowancesTypeIsOpen = false;
    salaryMethodIsOpen = false;
    notifyListeners();
  }

  /// ! Profile Image
  File? profileImage;
  String? base64Image;

  uploadProfileImage({required context, required offset}) async {
    if (kIsWeb) {
      base64Image = await uploadImageMenu(context: context, offset: offset);
    } else {
      profileImage = await uploadImageMenu(context: context, offset: offset);
    }
    notifyListeners();
  }

  onDateSelectionChanged(args, TextEditingController date, Function onSelect) {
    String selectedDate = DateFormat('dd/ MM / yyyy ').format(args);
    date.text = selectedDate;
    onSelect();
    notifyListeners();
  }

  navigateTo(value) {
    currentScreen = value;
    notifyListeners();
  }

  getFileForWeb(List addFile) async {
    var pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (pickedFile != null) {
      PlatformFile file = pickedFile.files.first;

      fileTypeLicense = file.name.split(".").last.toString();
      fileNameLicense = file.name.split(".").first.toString();

      Uint8List? uploadFile = pickedFile.files.single.bytes;
      String uploadFileEncoded = base64Encode(uploadFile!);
      print('uploadFileEncoded ${addFile}');
      notifyListeners();
      return addFile.add({
        "FileLicense": uploadFileEncoded,
        "FileLicenseName": fileNameLicense,
        "FileLicenseType": fileTypeLicense,
      });
    }
  }

  deleteFile(List deleteFile) {
    deleteFile.removeAt(0);
    notifyListeners();
  }

  addTaxName() {
    if (tax.isNotEmpty) {
      tax.add({
        'taxName': deductionTaxNameCtrl.text,
        'taxPercentage': taxPercentageCtrl.text,
        'taxAmount': taxAmount,
      });
    }
    notifyListeners();
  }

  clearTax() {
    deductionTaxNameCtrl.text = '';
    taxPercentageCtrl.text = '';
    taxAmount = 0.0;
  }

  removeTax(int index) {
    if (tax.length > 1) {
      tax.removeAt(index);
    } else {
      tax[index] = "";
    }
    notifyListeners();
  }
}
