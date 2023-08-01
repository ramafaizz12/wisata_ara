part of 'status_bloc.dart';

@immutable
abstract class StatusState {}

class StatusInitial extends StatusState {}

class StatusNow extends StatusState {
  DataMeta? data;

  StatusNow({this.data});
}
