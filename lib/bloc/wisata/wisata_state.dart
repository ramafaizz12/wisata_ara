part of 'wisata_bloc.dart';

@immutable
abstract class WisataState {}

class WisataInitial extends WisataState {}

class WisataLoaded extends WisataState {
  List<Wisata>? data;
  WisataLoaded({this.data});
}

class WisataFailed extends WisataState {
  String? err;

  WisataFailed({this.err});
}
