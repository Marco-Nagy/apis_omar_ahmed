class AccountListModel {
  List<AccountListBean> accountList;
  dynamic errors;
  bool result;

  AccountListModel(
      {required this.accountList, this.errors, required this.result});

  factory AccountListModel.fromJson(Map<dynamic, dynamic> json) {
    return AccountListModel(
      accountList: (json['AccountList'] as List)
          .map((json) => AccountListBean.fromJson(json))
          .toList(),
      errors: json['Errors'],
      result: json['Result'],
    );
  }
}

class AccountListBean {
  String accountName;
  String accountNumber;
  String accountTypeName;
  String advancedTypeName;
  String categoryName;
  String currencyName;
  bool haveChild;
  int iD;

  AccountListBean(
      {required this.accountName,
      required this.accountNumber,
      required this.accountTypeName,
      required this.advancedTypeName,
      required this.categoryName,
      required this.currencyName,
      required this.haveChild,
      required this.iD});

  factory AccountListBean.fromJson(Map<String, dynamic> json) {
    return AccountListBean(
      accountName: json['AccountName'].toString(),
      accountNumber: json['AccountNumber'].toString(),
      accountTypeName: json['AccountTypeName'].toString(),
      advancedTypeName: json['AdvancedTypeName'].toString(),
      categoryName: json['CategoryName'].toString(),
      currencyName: json['CurrencyName'].toString(),
      haveChild: json['HaveChild'],
      iD: json['ID'],
    );
  }
}
