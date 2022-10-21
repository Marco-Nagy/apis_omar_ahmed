class CostCenterModel {
  List<CostCenterList> dDLList;
  List? errors;
  bool result;

  CostCenterModel({
    required this.dDLList,
    this.errors,
    required this.result,
  });

  factory CostCenterModel.fromJson(Map<dynamic, dynamic> map) {
    return CostCenterModel(
      dDLList: (map['DDLList'] as List)
          .map((json) => CostCenterList.fromJson(json))
          .toList(),
      errors: map['Errors'] as List,
      result: map['Result'] as bool,
    );
  }
}

class CostCenterList {
  String id;
  String name;

  CostCenterList({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Name': name,
    };
  }

  factory CostCenterList.fromJson(Map<dynamic, dynamic> json) {
    return CostCenterList(
      id: json['ID'].toString(),
      name: json['Name'].toString(),
    );
  }
}
