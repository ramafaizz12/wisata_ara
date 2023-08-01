import 'package:json_annotation/json_annotation.dart';

part 'budaya.g.dart';

@JsonSerializable()
class Budayaa {
  int? id;
  String? nama_budaya;
  List<String>? gambar;
  String? deskripsi;

  Budayaa({this.id, this.nama_budaya, this.gambar, this.deskripsi});

  factory Budayaa.fromJson(Map<String, dynamic> data) =>
      _$BudayaaFromJson(data);

  Map<String, dynamic> toJson() => _$BudayaaToJson(this);
}
