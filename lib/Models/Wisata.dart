import 'package:json_annotation/json_annotation.dart';

part 'Wisata.g.dart';

@JsonSerializable()
class Wisata {
  int? id;
  String? nama_wisata;
  List<String>? gambar;
  String? deskripsi;

  Wisata({this.id, this.nama_wisata, this.gambar, this.deskripsi});

  factory Wisata.fromJson(Map<String, dynamic> data) => _$WisataFromJson(data);

  Map<String, dynamic> toJson() => _$WisataToJson(this);
}
