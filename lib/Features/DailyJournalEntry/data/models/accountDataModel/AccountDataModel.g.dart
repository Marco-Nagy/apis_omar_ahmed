// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccountDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDataModel _$AccountDataModelFromJson(Map<String, dynamic> json) =>
    AccountDataModel(
      json['accountId'] as String?,
      json['accountName'] as String?,
      json['accountCategory'] as String?,
      json['currency'] as String?,
      json['accountType'] as String?,
      double.parse(json['amount']).toDouble(),
      json['increase'] as bool?,
      json['edit'] as bool?,
      json['type'] as String?,
      json['client'] as String?,
      json['project'] as String?,
      json['supplier'] as String?,
      json['purchasePO'] as String?,
      json['costCenter'] as String?,
      json['paymentMethod'] as String?,
      json['beneficiaryType'] as String?,
      json['beneficiaryName'] as String?,
      json['person'] as String?,
    );

Map<String, dynamic> _$AccountDataModelToJson(AccountDataModel instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'accountCategory': instance.accountCategory,
      'currency': instance.currency,
      'accountType': instance.accountType,
      'amount': instance.amount,
      'increase': instance.increase,
      'edit': instance.edit,
      'type': instance.type,
      'client': instance.client,
      'project': instance.project,
      'supplier': instance.supplier,
      'purchasePO': instance.purchasePO,
      'costCenter': instance.costCenter,
      'paymentMethod': instance.paymentMethod,
      'beneficiaryType': instance.beneficiaryType,
      'beneficiaryName': instance.beneficiaryName,
      'person': instance.person,
    };
