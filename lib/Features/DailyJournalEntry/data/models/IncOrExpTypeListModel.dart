class IncOrExpTypeListModel {
  List<IncOrExpTypeList> dDLList;
  List? errors;
  bool result;

  IncOrExpTypeListModel({
    required this.dDLList,
    this.errors,
    required this.result,
  });

  factory IncOrExpTypeListModel.fromJson(Map<dynamic, dynamic> json) {
    return IncOrExpTypeListModel(
      dDLList: (json['DDLList'] as List)
          .map((json) => IncOrExpTypeList.fromJson(json))
          .toList(),
      errors: json['Errors'] as List,
      result: json['Result'],
    );
  }
}

class IncOrExpTypeList {
  String id;
  String name;

  IncOrExpTypeList({
    required this.id,
    required this.name,
  });

  factory IncOrExpTypeList.fromJson(Map<dynamic, dynamic> json) {
    return IncOrExpTypeList(
        id: json['ID'].toString(), name: json['Name'].toString());
  }

  // @override
  // String toString() {
  //   return ' $id , $name';
  // }
}
