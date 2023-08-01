// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Wisata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wisata _$WisataFromJson(Map<String, dynamic> json) => Wisata(
      id: json['id'] as int?,
      nama_wisata: json['nama_wisata'] as String?,
      gambar:
          (json['gambar'] as List<dynamic>?)?.map((e) => e as String).toList(),
      deskripsi: json['deskripsi'] as String?,
    );

Map<String, dynamic> _$WisataToJson(Wisata instance) => <String, dynamic>{
      'id': instance.id,
      'nama_wisata': instance.nama_wisata,
      'gambar': instance.gambar,
      'deskripsi': instance.deskripsi,
    };
