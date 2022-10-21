import 'dart:convert';
import 'dart:typed_data';

import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/data_sources/GarasWebsevice/GarasWebService.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/models/DailyJournalEntryDataInfoModel.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/models/DailyJournalEntryDateListModel.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/models/PaymentMethodModel.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/models/PersonModel.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/models/ProjectModel.dart';
import 'package:apis_omar_ahmed/Features/DailyJournalEntry/data/models/accountDataModel/AccountDataModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../data/data_sources/GarasWebsevice/endPoints.dart';
import '../../data/models/AccountListModel.dart';
import '../../data/models/ClientModel.dart';
import '../../data/models/CostCenterModel.dart';
import '../../data/models/DailyJournalEntryPerDateListModel.dart';
import '../../data/models/IncOrExpTypeListModel.dart';
import '../../data/models/PurchasePOModel.dart';
import '../../data/models/SupplierModel.dart';

class DailyJournalProvider extends ChangeNotifier {
  GarasWebServices garasWebServices;

  DailyJournalProvider(this.garasWebServices) {
    accountScrollController = ScrollController()..addListener(loadAccountsData);
    incOrExpTypeScrollController = ScrollController()
      ..addListener(loadIncOrExpTypeData);
    clientScrollController = ScrollController()..addListener(loadNewClientData);
    projectScrollController = ScrollController()
      ..addListener(loadNewProjectData);
    supplierScrollController = ScrollController()
      ..addListener(loadNewSupplierData);
    purchasePOScrollController = ScrollController()
      ..addListener(loadNewPurchasePOData);
    costCenterScrollController = ScrollController()
      ..addListener(loadNewCostCenterData);
    personScrollController = ScrollController()..addListener(loadNewPersonData);
  }
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  TextEditingController typeNameCtrl = TextEditingController();
  TextEditingController clientCtrl = TextEditingController();
  TextEditingController supplierCtrl = TextEditingController();
  TextEditingController costCenterCtrl = TextEditingController();
  TextEditingController projectCtrl = TextEditingController();
  TextEditingController purchasePOCtrl = TextEditingController();
  TextEditingController paymentMethodNameCtrl = TextEditingController();
  TextEditingController beneficiaryTypeCtrl = TextEditingController();
  TextEditingController beneficiaryNameCtrl = TextEditingController();
  TextEditingController personCtrl = TextEditingController();
  TextEditingController typeSearchController = TextEditingController();
  TextEditingController accountNameSearchController = TextEditingController();
  TextEditingController clientSearchController = TextEditingController();
  TextEditingController supplierSearchController = TextEditingController();
  TextEditingController projectSearchController = TextEditingController();
  TextEditingController purchasePOSearchController = TextEditingController();
  TextEditingController paymentMethodSearchController = TextEditingController();
  TextEditingController costCenterSearchController = TextEditingController();
  TextEditingController beneficiaryTypeSearchController =
      TextEditingController();
  TextEditingController beneficiaryNameSearchController =
      TextEditingController();
  TextEditingController personSearchController = TextEditingController();

  bool? increase;
  bool edit = false;
  String accountType = '';
  String accountCurrency = '';
  String accountId = '';
  String accountCategory = '';
  String accountNumber = '';
  List fromAccountEntryList = [];

  //! Date Picker

  var filterDateController = TextEditingController();
  var filterSearchKeyController = TextEditingController();

  String now = DateFormat('dd/MM/yyyy').format(DateTime.now());

  bool isDatePicker = false;

  expandedDatePicker(value) {
    isDatePicker = value;
    notifyListeners();
  }

  String? selectedDate;

  onDateSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    selectedDate = DateFormat('dd/ MM / yyyy ').format(args.value);
    dateController.text = selectedDate ?? 'SelectedDate';

    expandedDatePicker(false);
    notifyListeners();
  }

  resetFilter() {
    filterSearchKeyController.clear();
    notifyListeners();
  }

  String convertJsonDateToDateTime(String jsonDate) {
    if (jsonDate.isNotEmpty) {
      var raw = jsonDate;

      var numeric = raw.split('(')[1].split(')')[0];
      var negative = numeric.contains('-');
      var parts = numeric.split(negative ? '-' : '+');
      var millis = int.parse(parts[0]);

      var local = DateTime.fromMillisecondsSinceEpoch(millis);
      String dateTime = DateFormat('dd/MM/yyyy').format(local);

      return dateTime;
    } else {
      return " ";
    }
  }

  formatter(number) {
    return NumberFormat('#,##0.00').format(number);
  }

  ///! APIs Calls

  /// * Account List

  //! Getting
  AccountListModel accountListModel =
      AccountListModel(accountList: [], result: false);
  List<AccountListBean> accountList = [];

  getAccountList() async {
    Uri uri = Uri.parse(EndPoints.baseUrlPart1 +
        EndPoints.baseUrlPart2 +
        EndPoints.GetAccountsEntryList);
    http.Response response = await HttpHelper.getApi(
      url: uri,
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      accountListModel = AccountListModel.fromJson(_response);
      accountList = accountListModel.accountList;
    }

    notifyListeners();
  }

  accountsSearchBox(String query, context) {
    accountList = accountListModel.accountList
        .where((element) =>
            element.accountName
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            element.accountNumber
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //? pagination
  late ScrollController accountScrollController;
  int accountItems = 50;

  loadAccountsData() {
    if (accountScrollController.positions
        .any((pos) => pos.maxScrollExtent == accountScrollController.offset)) {
      accountItems += 50;
    }

    notifyListeners();
  }

  //? Setting
  bool selectedFromToAccountText = false;

  onClickFromToAccount() {
    selectedFromToAccountText = !selectedFromToAccountText;
    typeNameCtrl.text = '';
    clientCtrl.text = '';
    clientId = '';
    supplierCtrl.text = '';
    supplierId = '';
    projectCtrl.text = '';
    projectId = '';
    purchasePOCtrl.text = '';
    purchasePOId = '';
    notifyListeners();
  }

  setFromToAccountText(
      {required String? name, type, currency, id, category, accNumber, value}) {
    if (id != null) accountId = id;
    if (currency != null) accountCurrency = currency;
    if (name != null) accountNameCtrl.text = name.toString();
    if (type != null) accountType = type;
    if (accNumber != null) accountNumber = accNumber;
    if (category != null) accountCategory = category;
    if (value != null) selectedFromToAccountText = value;

    notifyListeners();
  }

  /// * IncOrExpType List
  // ! GetData
  IncOrExpTypeListModel incOrExpTypeListModel = IncOrExpTypeListModel(
    dDLList: [],
    result: false,
  );
  List<IncOrExpTypeList> incExpTypeList = [];

  getIncExpTypeList(accountID) async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 +
          EndPoints.baseUrlPart2 +
          EndPoints.GetIncOrExpTypeList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
        "AccountID": "$accountID",
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      incOrExpTypeListModel = IncOrExpTypeListModel.fromJson(_response);
      incExpTypeList = incOrExpTypeListModel.dDLList;
    }

    notifyListeners();
  }

  incExpTypeSearchBox(String query, context) {
    incExpTypeList = incOrExpTypeListModel.dDLList
        .where((element) =>
            element.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //? pagination
  late ScrollController incOrExpTypeScrollController;
  int incOrExpTypeItems = 50;

  loadIncOrExpTypeData() {
    if (accountScrollController.positions.any(
        (pos) => pos.maxScrollExtent == incOrExpTypeScrollController.offset)) {
      incOrExpTypeItems += 50;
    }

    notifyListeners();
  }

  ///? SetData

  bool selectedTypeText = false;

  onClickType() {
    selectedTypeText = !selectedTypeText;
    notifyListeners();
  }

  setTypeText({String? typeName, bool? value}) async {
    selectedTypeText = value!;
    typeNameCtrl.text = typeName.toString();
    notifyListeners();
  }

  /// * ClientList
  //! GetData
  ClientModel clientModel = ClientModel(dDLList: [], result: false);
  List<ClientList> clientList = [];
  int currentClientItems = 50;

  getClientList() async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 + EndPoints.GetClientList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      clientModel = ClientModel.fromJson(_response);

      clientList = clientModel.dDLList;
    }

    notifyListeners();
  }

  clientsSearchBox(String query, context) {
    clientList = clientModel.dDLList
        .where((element) =>
            element.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

//?Pagination
  late ScrollController clientScrollController;

  loadNewClientData() {
    if (clientScrollController.positions
        .any((pos) => pos.maxScrollExtent == clientScrollController.offset)) {
      currentClientItems += 50;
    }

    notifyListeners();
  }

  ///? SetData
  bool selectedClientText = false;
  String clientId = '';

  onClickClient() {
    selectedClientText = !selectedClientText;
    notifyListeners();
  }

  setClientText({String? name, String? id, bool? value}) async {
    if (value != null) selectedClientText = value;
    if (id != null) clientId = id.toString();
    if (name != null) clientCtrl.text = name.toString();
    notifyListeners();
  }

  /// * ProjectList
  //! GetData
  ProjectModel projectModel =
      ProjectModel(dDLList: [], result: false, errors: []);
  List<ProjectList> projectList = [];

  getProjectList(String clientID) async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 + EndPoints.GetProjectList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
        "ClientID": clientID,
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      projectModel = ProjectModel.fromJson(_response);
      projectList = projectModel.dDLList;
    }

    notifyListeners();
  }

  projectSearchBox(String query, context) {
    projectList = projectModel.dDLList
        .where((element) =>
            element.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

//?Pagination
  late ScrollController projectScrollController;
  int currentProjectItems = 50;

  loadNewProjectData() {
    if (projectScrollController.positions
        .any((pos) => pos.maxScrollExtent == projectScrollController.offset)) {
      currentProjectItems += 50;
    }
    notifyListeners();
  }

  ///? SetData
  bool selectedProjectText = false;
  String projectId = '';

  onClickProject() {
    selectedProjectText = !selectedProjectText;

    notifyListeners();
  }

  setProjectText({String? name, String? id, bool? value}) {
    if (value != null) selectedProjectText = value;
    if (id != null) projectId = id.toString();
    if (name != null) projectCtrl.text = name.toString();

    notifyListeners();
  }

  /// * SupplierList
  //! GetData
  SupplierModel supplierModel =
      SupplierModel(dDLList: [], result: false, errors: []);
  List<SupplierList> supplierList = [];

  getSupplierList() async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 + EndPoints.GetSupplierList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      supplierModel = SupplierModel.fromJson(_response);

      supplierList = supplierModel.dDLList;
    }

    notifyListeners();
  }

  supplierSearchBox(String query, context) {
    supplierList = supplierModel.dDLList
        .where((element) =>
            element.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

//?Pagination
  late ScrollController supplierScrollController;
  int currentSupplierItems = 50;

  loadNewSupplierData() {
    if (supplierScrollController.positions
        .any((pos) => pos.maxScrollExtent == supplierScrollController.offset)) {
      currentSupplierItems += 50;
    }

    notifyListeners();
  }

  ///? SetData
  bool selectedSupplierText = false;
  String supplierId = '';

  onClickSupplier() {
    selectedSupplierText = !selectedSupplierText;
    notifyListeners();
  }

  setSupplierText({name, id, value}) {
    selectedSupplierText = value;
    supplierId = id.toString();
    supplierCtrl.text = name.toString();
    notifyListeners();
  }

  /// * PurchasePOList

  PurchasePOModel purchasePOModel =
      PurchasePOModel(dDLList: [], result: false, errors: []);
  List<PurchasePOList> purchasePOList = [];

  getPurchasePOList(String supplierID) async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 + EndPoints.GetPurchasePOList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
        "SupplierID": supplierID,
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      purchasePOModel = PurchasePOModel.fromJson(_response);
      purchasePOList = purchasePOModel.dDLList;
    }

    notifyListeners();
  }

  purchasePOSearchBox(String query, context) {
    purchasePOList = purchasePOModel.dDLList
        .where((element) =>
            element.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

//?Pagination
  late ScrollController purchasePOScrollController;
  int currentPurchasePOItems = 50;

  loadNewPurchasePOData() {
    if (purchasePOScrollController.positions.any(
        (pos) => pos.maxScrollExtent == purchasePOScrollController.offset)) {
      currentPurchasePOItems += 50;
    }

    notifyListeners();
  }

  ///? SetData
  bool selectedPurchasePOText = false;
  String purchasePOId = '';

  onClickPurchasePO() {
    selectedPurchasePOText = !selectedPurchasePOText;

    notifyListeners();
  }

  setPurchasePOText({String? name, String? id, bool? value}) {
    if (value != null) selectedPurchasePOText = value;
    if (id != null) purchasePOId = id.toString();
    if (name != null) purchasePOCtrl.text = name.toString();

    notifyListeners();
  }

  /// * CostCenterList
  //! GetData
  CostCenterModel costCenterModel = CostCenterModel(dDLList: [], result: false);
  List<CostCenterList> costCenterList = [];

  getCostCenterList() async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 +
          EndPoints.baseUrlPart2 +
          EndPoints.GetCostCenterList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      costCenterModel = CostCenterModel.fromJson(_response);

      costCenterList = costCenterModel.dDLList;
    }

    notifyListeners();
  }

  costCenterSearchBox(String query, context) {
    costCenterList = costCenterModel.dDLList
        .where((element) =>
            element.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

//? Pagination
  late ScrollController costCenterScrollController;
  int currentCostCenterItems = 50;

  loadNewCostCenterData() {
    if (costCenterScrollController.positions.any(
        (pos) => pos.maxScrollExtent == costCenterScrollController.offset)) {
      currentCostCenterItems += 50;
    }

    notifyListeners();
  }

  ///? SetData

  bool selectedCostCenterText = false;
  String costCenterId = '';

  onClickCostCenter() {
    selectedCostCenterText = !selectedCostCenterText;
    notifyListeners();
  }

  setCostCenterText({String? name, String? id, bool? value}) async {
    if (id != null) costCenterId = id.toString();
    if (name != null) costCenterCtrl.text = name.toString();
    if (value != null) selectedCostCenterText = value;

    notifyListeners();
  }

  /// * PaymentMethod List
  PaymentMethodModel paymentMethodModel =
      PaymentMethodModel(dDLList: [], result: false, errors: []);
  List<PaymentMethodList> paymentMethodList = [];

  getPaymentMethodList() async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 +
          EndPoints.baseUrlPart2 +
          EndPoints.GetMethodTypeList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      paymentMethodModel = PaymentMethodModel.fromJson(_response);

      paymentMethodList = paymentMethodModel.dDLList;
    }

    notifyListeners();
  }

  paymentMethodSearchBox(String query, context) {
    paymentMethodList = paymentMethodModel.dDLList
        .where((element) =>
            element.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  bool selectedPaymentMethodText = false;
  String paymentMethodId = '';

  onClickPaymentMethod() {
    selectedPaymentMethodText = !selectedPaymentMethodText;
    notifyListeners();
  }

  setPaymentMethodText({String? name, String? id, bool? value}) async {
    selectedPaymentMethodText = value!;
    paymentMethodId = id.toString();
    paymentMethodNameCtrl.text = name.toString();
    notifyListeners();
  }

  /// * PersonList

  PersonModel personModel = PersonModel(dDLList: [], errors: [], result: false);
  List<PersonList> personList = [];

  getPersonList() async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 + EndPoints.GetUserList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      personModel = PersonModel.fromJson(_response);

      personList = personModel.dDLList;
    }

    notifyListeners();
  }

  personSearchBox(String query, context) {
    personList = personModel.dDLList
        .where((element) =>
            element.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //?Pagination
  late ScrollController personScrollController;
  int currentPersonItems = 50;

  loadNewPersonData() {
    if (personScrollController.positions
        .any((pos) => pos.maxScrollExtent == personScrollController.offset)) {
      currentPersonItems += 50;
    }

    notifyListeners();
  }

  ///? SetData
  bool selectedPersonText = false;
  String personId = '';

  onClickPerson() {
    selectedPersonText = !selectedPersonText;
    notifyListeners();
  }

  setPersonText({String? name, String? id, bool? value}) async {
    selectedPersonText = value!;
    personId = id.toString();
    personCtrl.text = name.toString();
    notifyListeners();
  }

  /// * DailyJournalEntry Date List
  DailyJournalEntryDateModel dailyJournalEntryDateModel =
      DailyJournalEntryDateModel(
    dailyJournalEntryList: [],
    result: false,
    errors: [],
  );

  int dateIndex = -1;
  bool entryDateListIsLoaded = false;
  getDailyJournalEntryDateList(String? searchKey) async {
    print('searchKey $searchKey');
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 +
          EndPoints.baseUrlPart2 +
          EndPoints.GetDailyJournalEntryDateList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
        if (searchKey != null && searchKey.isNotEmpty)
          "SearchKey": Uri.encodeFull(searchKey),
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      dailyJournalEntryDateModel =
          DailyJournalEntryDateModel.fromJson(_response);
      dailyJournalEntryDateModel.dailyJournalEntryList =
          dailyJournalEntryDateModel.dailyJournalEntryList.reversed.toList();
      print(
          'dailyJournalEntryDateList ${dailyJournalEntryDateModel.dailyJournalEntryList.length}');
      if (dailyJournalEntryDateModel.result == true &&
          dailyJournalEntryDateModel.dailyJournalEntryList.isNotEmpty &&
          entryPerDateListIsLoaded == false) {
        getDailyJournalEntryPerDateList(
          searchKey: filterSearchKeyController.text,
          dateToGetList:
              dailyJournalEntryDateModel.dailyJournalEntryList[0].dateToGetList,
          currentPage: '$entryJournalCurrentPage',
          numberOfItemsPerPage: '$numberOfItemsPerPage',
        );
        entryDateListIsLoaded = true;
      }
    }

    notifyListeners();
  }

  /// * DailyJournalEntryList PerDate

  int entryJournalCurrentPage = 1;
  int numberOfItemsPerPage = 20;
  bool entryPerDateListIsLoaded = false;
  DailyJournalEntryPerDateModel dailyJournalEntryPerDateModel =
      DailyJournalEntryPerDateModel(
    errors: [],
    result: false,
    dailyJournalEntryList: [],
    paginationHeader: PaginationHeader(
      currentPage: 0,
      totalItems: 0,
      totalPages: 0,
      itemsPerPage: 0,
    ),
  );
  List<DailyJournalEntryList> dailyJournalEntryList = [];

  getDailyJournalEntryPerDateList({
    required String dateToGetList,
    required String currentPage,
    required String numberOfItemsPerPage,
    String searchKey = '',
  }) async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 +
          EndPoints.baseUrlPart2 +
          EndPoints.GetDailyJournalEntryPerDateList),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
        "DateToGetList": dateToGetList,
        "CurrentPage": currentPage,
        "NumberOfItemsPerPage": numberOfItemsPerPage,
        "SearchKey": Uri.encodeFull(searchKey),
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      dailyJournalEntryPerDateModel =
          DailyJournalEntryPerDateModel.fromJson(_response);

      if (currentPage == '1') {
        dailyJournalEntryList =
            dailyJournalEntryPerDateModel.dailyJournalEntryList;
      } else {
        dailyJournalEntryList = dailyJournalEntryList +
            dailyJournalEntryPerDateModel.dailyJournalEntryList;
      }

      dateToGetList = dailyJournalEntryDateModel
          .dailyJournalEntryList[dateIndex].dateToGetList
          .toString();
      entryPerDateListIsLoaded = true;
    }

    notifyListeners();
  }

  DailyJournalEntryDataInfoModel dailyJournalEntryDataInfoModel =
      DailyJournalEntryDataInfoModel(
          data: Data(
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
          ),
          result: false);
  List<EntryAccountList> entryAccountList = [];
  int selectedAdjustEntryView = -1;
  int adjustEntryIndex = -1;

  getDailyJournalEntryInfoList(String dailyJournalEntryID) async {
    http.Response response = await HttpHelper.getApi(
      url: Uri.parse(EndPoints.baseUrlPart1 +
          EndPoints.baseUrlPart2 +
          EndPoints.GetDailyJournalEntryDataInfo),
      headers: {
        "UserToken": UserToken,
        "CompanyName": "marinaplt",
        "DailyJournalEntryID": dailyJournalEntryID,
      },
    );

    if (response.statusCode == 200) {
      Map _response = await json.decode(response.body);

      dailyJournalEntryDataInfoModel =
          DailyJournalEntryDataInfoModel.fromJson(_response);
      entryAccountList = dailyJournalEntryDataInfoModel.data.entryAccountList;
    }

    notifyListeners();
  }

  updateAdjustEntryViewIndex(index) async {
    selectedAdjustEntryView = index;
    notifyListeners();
  }

  updateAdjustEntryIndex(index) async {
    adjustEntryIndex = index;
    notifyListeners();
  }

  double debitAmount = 0.0;
  double creditAmount = 0.0;
  double totalDebitAmount = 0.0;
  double totalCreditAmount = 0.0;

  countDebitCreditAmountEntryView(index) {
    totalDebitAmount = 0.0;
    totalCreditAmount = 0.0;

    totalDebitAmount = entryAccountList.fold(
        0,
        (total, e) => (e.accountTypeName == 'Debit' &&
                    e.signOfAccount == 'plus') ||
                (e.accountTypeName == 'Credit' && e.signOfAccount == 'minus')
            ? double.parse(e.amount) + total
            : 0 + total);

    totalCreditAmount = entryAccountList.fold(
        0,
        (total, e) =>
            (e.accountTypeName == 'Debit' && e.signOfAccount == 'minus') ||
                    (e.accountTypeName == 'Credit' && e.signOfAccount == 'plus')
                ? double.parse(e.amount) + total
                : 0 + total);
    notifyListeners();
  }

  ///! Local Data

  List<AccountDataModel> adjustEntryListView = <AccountDataModel>[];

  // * List of From Accounts
  int indexOfAdjustEntry = -1;
  int indexOfEdit = -1;
  TextEditingController accountNameCtrl = TextEditingController();
  var amountCtrl = TextEditingController();
  String dAmount = '';

  addAccountEntry() async {
    fromAccountEntryList.add({
      "accountId": accountId,
      "accountName": accountNameCtrl.text,
      "currency": accountCurrency,
      "accountCategory": accountCategory,
      "accountType": accountType,
      "amount": dAmount,
      "increase": increase,
      "edit": false,
      "type": typeNameCtrl.text,
      'client': clientCtrl.text,
      'project': projectCtrl.text,
      'supplier': supplierCtrl.text,
      'purchasePO': purchasePOCtrl.text,
      'costCenter': costCenterCtrl.text,
      'paymentMethod': paymentMethodNameCtrl.text,
      'beneficiaryType': beneficiaryTypeCtrl.text,
      'beneficiaryName': beneficiaryNameCtrl.text,
      'person': personCtrl.text,
    });
    countDebitCreditAmountAddNewEntry();
    notifyListeners();
  }

  countDebitCreditAmountAddNewEntry() {
    totalDebitAmount = 0.0;
    totalDebitAmount = fromAccountEntryList.fold(
        0,
        (total, e) => (e['accountType'] == 'Debit' && e['increase'] == true) ||
                (e['accountType'] == 'Credit' && e['increase'] == false)
            ? double.parse(e['amount']) + total
            : 0 + total);
    totalCreditAmount = 0.0;

    totalCreditAmount = fromAccountEntryList.fold(
        0,
        (total, e) => (e['accountType'] == 'Credit' && e['increase'] == true) ||
                (e['accountType'] == 'Debit' && e['increase'] == false)
            ? double.parse(e['amount']).toDouble() + total
            : 0 + total);
    notifyListeners();
  }

  clearData() {
    accountId = '';
    accountCategory = '';
    accountType = '';
    accountCurrency = '';
    accountCategory = '';
    accountNumber = '';
    accountNameCtrl.text = '';
    amountCtrl.text = '';
    typeNameCtrl.text = '';
    clientCtrl.text = '';
    clientId = '';
    supplierCtrl.text = '';
    supplierId = '';
    projectCtrl.text = '';
    projectId = '';
    purchasePOCtrl.text = '';
    purchasePOId = '';
    costCenterCtrl.text = '';
    paymentMethodNameCtrl.text = '';
    beneficiaryTypeCtrl.text = '';
    beneficiaryNameCtrl.text = '';
    personCtrl.text = '';

    increase = null;
    indexOfAdjustEntry = -1;
    notifyListeners();
  }

  getSavedEntry(index) {
    indexOfAdjustEntry = index;
    accountNameCtrl.text = fromAccountEntryList[index]['accountName'];
    accountCategory = fromAccountEntryList[index]['accountCategory'];
    amountCtrl.text = fromAccountEntryList[index]['amount'];
    typeNameCtrl.text = fromAccountEntryList[index]['type'];
    clientCtrl.text = fromAccountEntryList[index]['client'];
    projectCtrl.text = fromAccountEntryList[index]['project'];
    supplierCtrl.text = fromAccountEntryList[index]['supplier'];
    purchasePOCtrl.text = fromAccountEntryList[index]['purchasePO'];
    costCenterCtrl.text = fromAccountEntryList[index]['costCenter'];
    paymentMethodNameCtrl.text = fromAccountEntryList[index]['paymentMethod'];
    beneficiaryTypeCtrl.text = fromAccountEntryList[index]['beneficiaryType'];
    beneficiaryNameCtrl.text = fromAccountEntryList[index]['beneficiaryName'];
    personCtrl.text = fromAccountEntryList[index]['person'];
    increase = fromAccountEntryList[index]['increase'];
    edit = fromAccountEntryList[index]['edit'];
    countDebitCreditAmountAddNewEntry();
    notifyListeners();
  }

  updateAccountEntry(index) {
    fromAccountEntryList[index]['accountName'] = accountNameCtrl.text;
    fromAccountEntryList[index]['accountCategory'] = accountCategory;
    fromAccountEntryList[index]['amount'] = amountCtrl.text;
    fromAccountEntryList[index]['type'] = typeNameCtrl.text;
    fromAccountEntryList[index]['client'] = clientCtrl.text;
    fromAccountEntryList[index]['project'] = projectCtrl.text;
    fromAccountEntryList[index]['supplier'] = supplierCtrl.text;
    fromAccountEntryList[index]['purchasePO'] = purchasePOCtrl.text;
    fromAccountEntryList[index]['costCenter'] = costCenterCtrl.text;
    fromAccountEntryList[index]['paymentMethod'] = paymentMethodNameCtrl.text;
    fromAccountEntryList[index]['beneficiaryType'] = beneficiaryTypeCtrl.text;
    fromAccountEntryList[index]['beneficiaryName'] = beneficiaryNameCtrl.text;
    fromAccountEntryList[index]['person'] = personCtrl.text;
    fromAccountEntryList[index]['increase'] = increase;
    fromAccountEntryList[index]['edit'] = false;
    countDebitCreditAmountAddNewEntry();
    notifyListeners();
  }

  updateIncrease(value) async {
    increase = value;

    notifyListeners();
  }

  updateEdit(index) async {
    edit = !edit;
    fromAccountEntryList[index]['edit'] = edit;
    notifyListeners();
  }

  removeAccountEntry(index) {
    if (index == 0) {
      fromAccountEntryList.removeAt(index);
    } else {
      fromAccountEntryList.removeAt(index);
    }
    countDebitCreditAmountAddNewEntry();
  }

  setAmount({required String amount}) async {
    //amountCtrl.text = amount;
    dAmount = amount.replaceAll(',', '');

    notifyListeners();
  }

  bool selectedBeneficiaryTypeText = false;
  String beneficiaryTypeId = '';

  onClickBeneficiaryType() {
    selectedBeneficiaryTypeText = !selectedBeneficiaryTypeText;
    notifyListeners();
  }

  setBeneficiaryTypeText({String? name, String? id, bool? value}) async {
    selectedBeneficiaryTypeText = value!;
    beneficiaryTypeId = id.toString();
    beneficiaryTypeCtrl.text = name.toString();
    notifyListeners();
  }

  bool selectedBeneficiaryNameText = false;
  String beneficiaryNameId = '';

  onClickBeneficiaryName() {
    selectedBeneficiaryNameText = !selectedBeneficiaryNameText;
    notifyListeners();
  }

  setBeneficiaryNameText({String? name, String? id, bool? value}) async {
    selectedBeneficiaryNameText = value!;
    beneficiaryNameId = id.toString();
    beneficiaryNameCtrl.text = name.toString();
    notifyListeners();
  }

  closeAllDropDownList() {
    selectedFromToAccountText = false;
    selectedTypeText = false;
    selectedClientText = false;
    selectedProjectText = false;
    selectedSupplierText = false;
    selectedPurchasePOText = false;
    selectedCostCenterText = false;
    selectedPaymentMethodText = false;
    selectedBeneficiaryTypeText = false;
    selectedBeneficiaryNameText = false;
    selectedPersonText = false;
    notifyListeners();
  }

  ///! Navigation Screens
  bool isExpandedDailyJournal = false;

  expandedDailyJournalList(value) {
    isExpandedDailyJournal = value;
    notifyListeners();
  }

  bool journalEntry = false;

  updateJournalEntryScreen(value) {
    journalEntry = value;
    notifyListeners();
  }

  ///! Expandable List Functions

  int selectedIndex = 0;

  expandWebShrinkTile(int index) {
    if (index == -1) {
      selectedIndex = index;
    } else if (index == selectedIndex) {
      selectedIndex = -1;
    } else if (index != selectedIndex) {
      selectedIndex = index;
    }

    notifyListeners();
  }

  scrollDown(ScrollController scrollController, int index) {
    if (scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 1)).then((value) {
        scrollController.jumpTo(index * 40);
      });
    }
  }

  resetDailyJournalEntryDate() {
    dailyJournalEntryDateModel.result = false;
    dailyJournalEntryDateModel.dailyJournalEntryList.clear();
    dailyJournalEntryDateModel.errors.clear();

    notifyListeners();
  }

  resetDailyJournalEntryPerDate() {
    dailyJournalEntryPerDateModel.result = false;
    dailyJournalEntryPerDateModel.dailyJournalEntryList.clear();
    dailyJournalEntryPerDateModel.errors.clear();
    dailyJournalEntryPerDateModel.paginationHeader.currentPage = 0;
    dailyJournalEntryPerDateModel.paginationHeader.itemsPerPage = 0;
    dailyJournalEntryPerDateModel.paginationHeader.totalItems = 0;
    dailyJournalEntryPerDateModel.paginationHeader.totalPages = 0;
    dailyJournalEntryList.clear();

    notifyListeners();
  }

  bool isSheetExpanded = false;
  onBottomSheetExpanded({required bool isExpanded}) {
    isSheetExpanded = isExpanded;
    notifyListeners();
  }

  String fileTypeLicense = " ";
  String fileNameLicense = " ";
  List saveFileLicenseList = [];
  getFileLicenseForWeb() async {
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

      saveFileLicenseList.add({
        "FileLicense": uploadFileEncoded,
        "FileLicenseName": fileNameLicense,
        "FileLicenseType": fileTypeLicense,
      });

      print('uploadFileEncoded ${saveFileLicenseList.toList()}');
    }
    notifyListeners();
  }

  deleteFileForWeb(index) {
    saveFileLicenseList.removeAt(index);
  }

  RegExp exp = RegExp("[a-zA-Z]");

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }
}
