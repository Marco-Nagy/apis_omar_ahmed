class SupplierModel {
  List<SupplierList> dDLList;
  List errors;
  bool result;

  SupplierModel({
    required this.dDLList,
    required this.errors,
    required this.result,
  });

  factory SupplierModel.fromJson(Map<dynamic, dynamic> json) {
    return SupplierModel(
      dDLList: (json['DDLList'] as List)
          .map((json) => SupplierList.fromJson(json))
          .toList(),
      errors: json['Errors'] as List,
      result: json['Result'] as bool,
    );
  }
}

class SupplierList {
  String id;
  String name;

  SupplierList({
    required this.id,
    required this.name,
  });

  factory SupplierList.fromJson(Map<dynamic, dynamic> json) {
    return SupplierList(
      id: json['ID'].toString(),
      name: json['Name'].toString(),
    );
  }
}
