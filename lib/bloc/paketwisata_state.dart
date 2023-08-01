part of 'paketwisata_bloc.dart';

@immutable
abstract class PaketwisataState {}

class PaketwisataInitial extends PaketwisataState {}

class PaketWisataLoaded extends PaketwisataState {
  List<PaketWisata>? data;

  PaketWisataLoaded({this.data});
}
