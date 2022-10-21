class ClientModel {
  List<ClientList> dDLList;
  List? errors;
  bool result;

  ClientModel({
    required this.dDLList,
    this.errors,
    required this.result,
  });

  factory ClientModel.fromJson(Map<dynamic, dynamic> map) {
    return ClientModel(
      dDLList: (map['DDLList'] as List)
          .map((json) => ClientList.fromJson(json))
          .toList(),
      errors: map['Errors'] as List,
      result: map['Result'] as bool,
    );
  }
}

class ClientList {
  String id;
  String name;

  ClientList({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Name': name,
    };
  }

  factory ClientList.fromJson(Map<dynamic, dynamic> json) {
    return ClientList(
      id: json['ID'].toString(),
      name: json['Name'].toString(),
    );
  }
}
