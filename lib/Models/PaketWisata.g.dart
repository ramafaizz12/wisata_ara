// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaketWisata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaketWisata _$PaketWisataFromJson(Map<String, dynamic> json) => PaketWisata(
      id: json['id'] as int?,
      nama_paket_wisata: json['nama_paket_wisata'] as String?,
      spot_wisata: json['spot_wisata'] as String?,
      gambar:
          (json['gambar'] as List<dynamic>?)?.map((e) => e as String).toList(),
      fasilitas: json['fasilitas'] as String?,
      harga: json['harga'] as String?,
      telepon: json['telepon'] as String?,
      villa: json['villa'] as String?,
    );

Map<String, dynamic> _$PaketWisataToJson(PaketWisata instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_paket_wisata': instance.nama_paket_wisata,
      'spot_wisata': instance.spot_wisata,
      'gambar': instance.gambar,
      'villa': instance.villa,
      'telepon': instance.telepon,
      'harga': instance.harga,
      'fasilitas': instance.fasilitas,
    };
