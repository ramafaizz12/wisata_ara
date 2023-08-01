// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Umkm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Umkm _$UmkmFromJson(Map<String, dynamic> json) => Umkm(
      id: json['id'] as int?,
      nama_umkm: json['nama_umkm'] as String?,
      gambar:
          (json['gambar'] as List<dynamic>?)?.map((e) => e as String).toList(),
      deskripsi: json['deskripsi'] as String?,
      telepon: json['telepon'] as String?,
      long: json['long'] as String?,
      lat: json['lat'] as String?,
    );

Map<String, dynamic> _$UmkmToJson(Umkm instance) => <String, dynamic>{
      'id': instance.id,
      'nama_umkm': instance.nama_umkm,
      'gambar': instance.gambar,
      'lat': instance.lat,
      'long': instance.long,
      'telepon': instance.telepon,
      'deskripsi': instance.deskripsi,
    };
