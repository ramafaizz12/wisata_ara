// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budaya.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Budayaa _$BudayaaFromJson(Map<String, dynamic> json) => Budayaa(
      id: json['id'] as int?,
      nama_budaya: json['nama_budaya'] as String?,
      gambar:
          (json['gambar'] as List<dynamic>?)?.map((e) => e as String).toList(),
      deskripsi: json['deskripsi'] as String?,
    );

Map<String, dynamic> _$BudayaaToJson(Budayaa instance) => <String, dynamic>{
      'id': instance.id,
      'nama_budaya': instance.nama_budaya,
      'gambar': instance.gambar,
      'deskripsi': instance.deskripsi,
    };
