import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wisata_ara/Models/PaketWisata.dart';
import 'package:wisata_ara/Services/services.dart';

import '../Services/Firebaseservices.dart';

part 'paketwisata_event.dart';
part 'paketwisata_state.dart';

class PaketwisataBloc extends Bloc<PaketwisataEvent, PaketwisataState> {
  PaketwisataBloc() : super(PaketwisataInitial()) {
    FirebaseService servis = FirebaseService();
    on<PaketwisataEvent>((event, emit) async {
      if (event is PaketWisataConnect) {
        var data = await servis.getdatapaketwisata();
        emit(PaketWisataLoaded(data: data));
      }
    });
  }
}
