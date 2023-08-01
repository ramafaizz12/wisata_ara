part of 'budaya_bloc.dart';

@immutable
abstract class BudayaState {}

class BudayaInitial extends BudayaState {}

class BudayaLoaded extends BudayaState {
  List<Budayaa>? data;

  BudayaLoaded({this.data});
}

class BudayaFailed extends BudayaState {
  String? err;

  BudayaFailed({this.err});
}
