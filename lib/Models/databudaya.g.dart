// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'databudaya.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBudaya _$DataBudayaFromJson(Map<String, dynamic> json) => DataBudaya(
      Meta: json['Meta'] == null
          ? null
          : DataMeta.fromJson(json['Meta'] as Map<String, dynamic>),
      Data: (json['Data'] as List<dynamic>?)
          ?.map((e) => Budayaa.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataBudayaToJson(DataBudaya instance) =>
    <String, dynamic>{
      'Meta': instance.Meta?.toJson(),
      'Data': instance.Data?.map((e) => e.toJson()).toList(),
    };
