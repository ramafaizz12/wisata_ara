import 'package:json_annotation/json_annotation.dart';
import 'package:wisata_ara/Models/budaya.dart';
import 'package:wisata_ara/Models/Meta.dart';
part 'databudaya.g.dart';

@JsonSerializable(explicitToJson: true)
class DataBudaya {
  DataMeta? Meta;
  List<Budayaa>? Data;

  DataBudaya({this.Meta, this.Data});

  factory DataBudaya.fromJson(Map<String, dynamic> data) =>
      _$DataBudayaFromJson(data);

  Map<String, dynamic> toJson() => _$DataBudayaToJson(this);
}
