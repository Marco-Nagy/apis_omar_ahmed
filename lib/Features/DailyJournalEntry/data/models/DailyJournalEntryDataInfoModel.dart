class DailyJournalEntryDataInfoModel {
  DailyJournalEntryDataInfoModel({
    required this.data,
    this.errors,
    required this.result,
  });

  Data data;
  List? errors;
  bool result;

  factory DailyJournalEntryDataInfoModel.fromJson(Map<dynamic, dynamic> json) {
    return DailyJournalEntryDataInfoModel(
      data: json['Data'] == null
          ? Data(
              active: false,
              amountTranaction: '',
              creationDate: '',
              creationUser: '',
              description: '',
              documentNumber: '',
              entryDate: '',
              id: '',
              serial: '',
              status: false,
              adjustingEntryAccountList: '',
              costCenter: CostCenter(
                  costCenterAmount: '',
                  costCenterID: '',
                  projectID: '',
                  projectName: ''),
              costCenterStatus: false,
              entryAccountList: [],
              entryDateSTR: '',
              beneficiaryToUser: BeneficiaryToUser(
                assignBeneficiaryID: '',
                assignBeneficiaryName: '',
                beneficiaryID: '',
                beneficiaryType: '',
              ),
            )
          : Data.fromJson(json['Data']),
      errors: json['Errors'],
      result: json['Result'],
    );
  }
}

class Data {
  bool active;
  String amountTranaction;
  String creationDate;
  String creationUser;
  String description;
  String documentNumber;
  String entryDate;
  String id;
  String serial;
  bool status;
  String adjustingEntryAccountList;
  CostCenter costCenter;
  bool costCenterStatus;
  List<EntryAccountList> entryAccountList;
  String entryDateSTR;
  BeneficiaryToUser beneficiaryToUser;

  Data({
    required this.active,
    required this.amountTranaction,
    required this.creationDate,
    required this.creationUser,
    required this.description,
    required this.documentNumber,
    required this.entryDate,
    required this.id,
    required this.serial,
    required this.status,
    required this.adjustingEntryAccountList,
    required this.costCenter,
    required this.costCenterStatus,
    required this.entryAccountList,
    required this.entryDateSTR,
    required this.beneficiaryToUser,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) {
    return Data(
      active: json['Active'],
      amountTranaction: json['AmountTranaction'].toString(),
      creationDate: json['CreationDate'].toString(),
      creationUser: json['CreationUser'].toString(),
      description: json['Description'].toString(),
      documentNumber: json['DocumentNumber'].toString(),
      entryDate: json['EntryDate'].toString(),
      id: json['ID'].toString(),
      serial: json['Serial'].toString(),
      status: json['Status'] as bool,
      adjustingEntryAccountList: json['adjustingEntryAccountList'].toString(),
      costCenter: json['CostCenter'] == null
          ? CostCenter(
              costCenterAmount: '',
              costCenterID: '',
              projectID: '',
              projectName: '')
          : CostCenter.fromJson(json['CostCenter']),
      costCenterStatus: json['CostCenterStatus'] as bool,
      entryAccountList: (json['EntryAccountList'] as List)
          .map((json) => EntryAccountList.fromJson(json))
          .toList(),
      entryDateSTR: json['EntryDateSTR'].toString(),
      beneficiaryToUser: json['BeneficiaryToUser'] == null
          ? BeneficiaryToUser(
              assignBeneficiaryID: '',
              assignBeneficiaryName: '',
              beneficiaryID: '',
              beneficiaryType: '',
            )
          : BeneficiaryToUser.fromJson(json['BeneficiaryToUser']),
    );
  }
}

class BeneficiaryToUser {
  BeneficiaryToUser({
    required this.assignBeneficiaryID,
    required this.assignBeneficiaryName,
    required this.beneficiaryID,
    required this.beneficiaryType,
  });

  String assignBeneficiaryID;
  String assignBeneficiaryName;
  String beneficiaryID;
  String beneficiaryType;

  factory BeneficiaryToUser.fromJson(Map<dynamic, dynamic> json) {
    return BeneficiaryToUser(
      assignBeneficiaryID: json['AssignBeneficiaryID'].toString(),
      assignBeneficiaryName: json['AssignBeneficiaryName'] ?? "",
      beneficiaryID: json['BeneficiaryID'].toString(),
      beneficiaryType: json['BeneficiaryType'] ?? "",
    );
  }
}

class EntryAccountList {
  String accountID;
  String accountName;
  String accountTypeName;
  String amount;
  String categoryID;
  String categoryName;
  String clinetID;
  String clinetName;
  String currencyID;
  String currencyName;
  bool fromAccount;
  String incOrExTypeID;
  String incOrExTypeName;
  String methodTypeID;
  String methodTypeName;
  String projectID;
  String projectName;
  String purchasePOID;
  String purchasePOName;
  String signOfAccount;
  String supplierID;
  String supplierName;

  EntryAccountList({
    required this.accountID,
    required this.accountName,
    required this.accountTypeName,
    required this.amount,
    required this.categoryID,
    required this.categoryName,
    required this.clinetID,
    required this.clinetName,
    required this.currencyID,
    required this.currencyName,
    required this.fromAccount,
    required this.incOrExTypeID,
    required this.incOrExTypeName,
    required this.methodTypeID,
    required this.methodTypeName,
    required this.projectID,
    required this.projectName,
    required this.purchasePOID,
    required this.purchasePOName,
    required this.signOfAccount,
    required this.supplierID,
    required this.supplierName,
  });

  factory EntryAccountList.fromJson(Map<dynamic, dynamic> json) {
    return EntryAccountList(
      accountID: json['AccountID'].toString(),
      accountName: json['AccountName'].toString(),
      accountTypeName: json['AccountTypeName'].toString(),
      amount: json['Amount'].toString(),
      categoryID: json['CategoryID'].toString(),
      categoryName: json['CategoryName'].toString(),
      clinetID: json['ClinetID'].toString(),
      clinetName: json['ClinetName'] ?? "",
      currencyID: json['CurrencyID'].toString(),
      currencyName: json['CurrencyName'].toString(),
      fromAccount: json['FromAccount'] ?? "",
      incOrExTypeID: json['IncOrExTypeID'].toString(),
      incOrExTypeName: json['IncOrExTypeName'] ?? "",
      methodTypeID: json['MethodTypeID'].toString(),
      methodTypeName: json['MethodTypeName'].toString(),
      projectID: json['ProjectID'].toString(),
      projectName: json['ProjectName'] ?? "",
      purchasePOID: json['PurchasePOID'].toString(),
      purchasePOName: json['PurchasePOName'].toString(),
      signOfAccount: json['SignOfAccount'].toString(),
      supplierID: json['SupplierID'].toString(),
      supplierName: json['SupplierName'].toString(),
    );
  }
}

class CostCenter {
  CostCenter({
    required this.costCenterAmount,
    required this.costCenterID,
    required this.projectID,
    required this.projectName,
  });

  String costCenterAmount;
  String costCenterID;
  String projectID;
  String projectName;

  factory CostCenter.fromJson(Map<dynamic, dynamic> json) {
    return CostCenter(
      costCenterAmount: json['CostCenterAmount'] ?? '',
      costCenterID: json['CostCenterID'].toString(),
      projectID: json['ProjectID'].toString(),
      projectName: json['ProjectName'] ?? '',
    );
  }
}
