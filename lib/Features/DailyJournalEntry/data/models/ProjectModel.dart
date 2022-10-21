class ProjectModel {
  List<ProjectList> dDLList;
  List errors;
  bool result;

  ProjectModel({
    required this.dDLList,
    required this.errors,
    required this.result,
  });

  factory ProjectModel.fromJson(Map<dynamic, dynamic> json) {
    return ProjectModel(
      dDLList: (json['DDLList'] as List)
          .map((json) => ProjectList.fromJson(json))
          .toList(),
      errors: json['Errors'] as List,
      result: json['Result'] as bool,
    );
  }
}

class ProjectList {
  String id;
  String name;
  String projectSerial;

  ProjectList({
    required this.id,
    required this.name,
    required this.projectSerial,
  });

  factory ProjectList.fromJson(Map<dynamic, dynamic> json) {
    return ProjectList(
      id: json['ID'].toString(),
      name: json['Name'].toString(),
      projectSerial: json['ProjectSerial'].toString(),
    );
  }
}
