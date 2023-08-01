import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wisata_ara/Models/budaya.dart';

import '../../Services/Firebaseservices.dart';
import '../../Services/services.dart';

part 'budaya_event.dart';
part 'budaya_state.dart';

class BudayaBloc extends Bloc<BudayaEvent, BudayaState> {
  BudayaBloc() : super(BudayaInitial()) {
    FirebaseService servis = FirebaseService();
    on<BudayaEvent>((event, emit) async {
      if (event is ConnectBudaya) {
        try {
          var data = await servis.getdatabudaya();
          emit(BudayaLoaded(data: data));
        } catch (e) {
          print(e.toString());
          emit(BudayaFailed(err: e.toString()));
        }
      }
    });
  }
}
