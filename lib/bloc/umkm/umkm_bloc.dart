import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/Umkm.dart';
import '../../Services/Firebaseservices.dart';
import '../../Services/services.dart';

part 'umkm_event.dart';
part 'umkm_state.dart';

class UmkmBloc extends Bloc<UmkmEvent, UmkmState> {
  UmkmBloc() : super(UmkmInitial()) {
    FirebaseService servis = FirebaseService();
    on<UmkmEvent>((event, emit) async {
      if (event is UmkmConnect) {
        try {
          var data = await servis.getdataumkm();
          emit(UmkmLoaded(data: data));
        } catch (e) {
          emit(UmkmFailed(err: e.toString()));
        }
      }
    });
  }
}
