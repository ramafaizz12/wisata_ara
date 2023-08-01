part of 'umkm_bloc.dart';

@immutable
abstract class UmkmState {}

class UmkmInitial extends UmkmState {}

class UmkmLoaded extends UmkmState {
  List<Umkm>? data;

  UmkmLoaded({this.data});
}

class UmkmFailed extends UmkmState {
  String? err;

  UmkmFailed({this.err});
}
