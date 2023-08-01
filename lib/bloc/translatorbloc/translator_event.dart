part of 'translator_bloc.dart';

@immutable
abstract class TranslatorEvent {}

class TranslatorLang extends TranslatorEvent {
  String teks;
  String judul;
  String kodebahasa;

  TranslatorLang(
      {this.teks = 'hello',
      this.kodebahasa = 'id',
      this.judul = 'wisata baru'});
}
