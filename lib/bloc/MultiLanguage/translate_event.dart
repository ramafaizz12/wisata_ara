part of 'translate_bloc.dart';

@immutable
abstract class TranslateEvent {}

class InputArgumen extends TranslateEvent {
  String kodebahasa;

  InputArgumen({this.kodebahasa = 'id'});
}
