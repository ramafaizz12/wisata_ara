import 'package:json_annotation/json_annotation.dart';

part 'PaketWisata.g.dart';

@JsonSerializable()
class PaketWisata {
  int? id;
  String? nama_paket_wisata;
  String? spot_wisata;
  List<String>? gambar;
  String? villa;
  String? telepon;
  String? harga;
  String? fasilitas;

  PaketWisata(
      {this.id,
      this.nama_paket_wisata,
      this.spot_wisata,
      this.gambar,
      this.fasilitas,
      this.harga,
      this.telepon,
      this.villa});

  factory PaketWisata.fromJson(Map<String, dynamic> data) =>
      _$PaketWisataFromJson(data);

  Map<String, dynamic> toJson() => _$PaketWisataToJson(this);
}
