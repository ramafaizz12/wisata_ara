part of 'wisata_bloc.dart';

@immutable
abstract class WisataEvent {}

class WisataConnect extends WisataEvent {
  // String kodebahasa;
}

class WisataSearch extends WisataEvent {
  String? value;

  WisataSearch({this.value});
}
