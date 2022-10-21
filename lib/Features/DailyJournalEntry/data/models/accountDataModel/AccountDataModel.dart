import 'package:json_annotation/json_annotation.dart';

part 'AccountDataModel.g.dart';

@JsonSerializable()
class AccountDataModel {
  factory AccountDataModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDataModelFromJson(json);
  Map<String, dynamic> toJson(instance) => _$AccountDataModelToJson(this);

  String? accountId;
  String? accountName;
  String? accountCategory;
  String? currency;
  String? accountType;
  double? amount;
  bool? increase;
  bool? edit;
  String? type;
  String? client;
  String? project;
  String? supplier;
  String? purchasePO;
  String? costCenter;
  String? paymentMethod;
  String? beneficiaryType;
  String? beneficiaryName;
  String? person;

  AccountDataModel(
      this.accountId,
      this.accountName,
      this.accountCategory,
      this.currency,
      this.accountType,
      this.amount,
      this.increase,
      this.edit,
      this.type,
      this.client,
      this.project,
      this.supplier,
      this.purchasePO,
      this.costCenter,
      this.paymentMethod,
      this.beneficiaryType,
      this.beneficiaryName,
      this.person);
}
