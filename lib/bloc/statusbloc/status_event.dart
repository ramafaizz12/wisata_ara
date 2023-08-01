part of 'status_bloc.dart';

@immutable
abstract class StatusEvent {}

class InputStatus extends StatusEvent {
  DataMeta? status;

  InputStatus({this.status});
}
