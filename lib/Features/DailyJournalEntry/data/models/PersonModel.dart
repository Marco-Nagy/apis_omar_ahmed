class PersonModel {
  List<PersonList> dDLList;
  List errors;
  bool result;
  PersonModel({
    required this.dDLList,
    required this.errors,
    required this.result,
  });

  factory PersonModel.fromJson(Map<dynamic, dynamic> json) {
    return PersonModel(
      dDLList: json['DDLList'] == null
          ? []
          : (json['DDLList'] as List)
              .map((json) => PersonList.fromJson(json))
              .toList(),
      errors: json['Errors'] ?? [],
      result: json['Result'] ?? false,
    );
  }
}

class PersonList {
  String branchName;
  String department;
  String email;
  List<GroupList> groupList;
  String id;
  String image;
  String jobTitleName;
  String name;
  List<RoleList> roleList;

  PersonList({
    required this.branchName,
    required this.department,
    required this.email,
    required this.groupList,
    required this.id,
    required this.image,
    required this.jobTitleName,
    required this.name,
    required this.roleList,
  });

  factory PersonList.fromJson(Map<dynamic, dynamic> json) {
    return PersonList(
      branchName: json['BranchName'].toString(),
      department: json['Department'].toString(),
      email: json['Email'].toString(),
      groupList: json['GroupList'] == null
          ? []
          : (json['GroupList'] as List)
              .map((json) => GroupList.fromJson(json))
              .toList(),
      id: json['ID'].toString(),
      image: json['Image'].toString(),
      jobTitleName: json['JobTitleName'].toString(),
      name: json['Name'].toString(),
      roleList: json['RoleList'] == null
          ? []
          : (json['RoleList'] as List)
              .map((json) => RoleList.fromJson(json))
              .toList(),
    );
  }
}

class RoleList {
  String roleID;
  String roleName;

  RoleList({
    required this.roleID,
    required this.roleName,
  });

  factory RoleList.fromJson(Map<dynamic, dynamic> json) {
    return RoleList(
      roleID: json['RoleID'].toString(),
      roleName: json['RoleName'].toString(),
    );
  }
}

class GroupList {
  String groupID;
  String groupName;

  GroupList({
    required this.groupID,
    required this.groupName,
  });

  factory GroupList.fromJson(Map<dynamic, dynamic> json) {
    return GroupList(
      groupID: json['GroupID'].toString(),
      groupName: json['GroupName'].toString(),
    );
  }
}
