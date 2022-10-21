class PurchasePOModel {
  List<PurchasePOList> dDLList;
  List errors;
  bool result;

  PurchasePOModel({
    required this.dDLList,
    required this.errors,
    required this.result,
  });

  factory PurchasePOModel.fromJson(Map<dynamic, dynamic> json) {
    return PurchasePOModel(
      dDLList: (json['DDLList'] as List)
          .map((json) => PurchasePOList.fromJson(json))
          .toList(),
      errors: json['Errors'] as List,
      result: json['Result'] as bool,
    );
  }
}

class PurchasePOList {
  String id;
  String name;

  PurchasePOList({
    required this.id,
    required this.name,
  });

  factory PurchasePOList.fromJson(Map<dynamic, dynamic> json) {
    return PurchasePOList(
      id: json['ID'].toString(),
      name: json['Name'].toString(),
    );
  }
}
