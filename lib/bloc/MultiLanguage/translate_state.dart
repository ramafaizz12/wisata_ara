part of 'translate_bloc.dart';

@immutable
abstract class TranslateState {}

class TranslateInitial extends TranslateState {}

class TranslateLoaded extends TranslateState {
  String? value;
  String? kodebahasa;
  TranslateLoaded({this.value, this.kodebahasa});
}
