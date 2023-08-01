import 'package:json_annotation/json_annotation.dart';

part 'Umkm.g.dart';

@JsonSerializable()
class Umkm {
  int? id;
  String? nama_umkm;
  List<String>? gambar;
  String? lat;
  String? long;
  String? telepon;

  String? deskripsi;

  Umkm(
      {this.id,
      this.nama_umkm,
      this.gambar,
      this.deskripsi,
      this.telepon,
      this.long,
      this.lat});

  factory Umkm.fromJson(Map<String, dynamic> data) => _$UmkmFromJson(data);

  Map<String, dynamic> toJson() => _$UmkmToJson(this);
}
