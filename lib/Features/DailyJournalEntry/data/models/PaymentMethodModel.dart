class PaymentMethodModel {
  List<PaymentMethodList> dDLList;
  List errors;
  bool result;

  PaymentMethodModel({
    required this.dDLList,
    required this.errors,
    required this.result,
  });

  factory PaymentMethodModel.fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethodModel(
      dDLList: (json['DDLList'] as List)
          .map((json) => PaymentMethodList.fromJson(json))
          .toList(),
      errors: json['Errors'] as List,
      result: json['Result'] as bool,
    );
  }
}

class PaymentMethodList {
  String id;
  String name;

  PaymentMethodList({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Name': name,
    };
  }

  factory PaymentMethodList.fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethodList(
      id: json['ID'].toString(),
      name: json['Name'].toString(),
    );
  }
}
