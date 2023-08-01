import 'package:bloc/bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:meta/meta.dart';
import 'package:translator/translator.dart';
import 'package:wisata_ara/Services/Firebaseservices.dart';
import 'package:wisata_ara/bloc/MultiLanguage/translate_bloc.dart';

import '../../Models/PaketWisata.dart';
import '../../Models/Wisata.dart';
import '../../Services/services.dart';

part 'wisata_event.dart';
part 'wisata_state.dart';

class WisataBloc extends Bloc<WisataEvent, WisataState> {
  WisataBloc() : super(WisataInitial()) {
    FirebaseService servis = FirebaseService();
    List<Wisata>? data = [];
    // List<Wisata>? databaru = [];
    List<Wisata>? foundUsers = [];
    on<WisataEvent>((event, emit) async {
      if (event is WisataConnect) {
        try {
          data = await servis.getdatawisata();
          emit(WisataLoaded(data: data));
          // if (event.kodebahasa == 'id') {
          //   for (var x in data!) {
          //     var transalater =
          //         await translator.translate(x.deskripsi.toString(), to: 'id');
          //     print(transalater);
          //   }
          // }
        } catch (e) {
          emit(WisataFailed(err: e.toString()));
        }
      }
      if (event is WisataSearch) {
        List<Wisata> results = [];

        if (event.value!.isEmpty) {
          results = data!;
        } else {
          results = data!
              .where((e) => e.nama_wisata!
                  .toLowerCase()
                  .contains(event.value!.toLowerCase()))
              .toList();
        }
        foundUsers = results;

        emit(WisataLoaded(
          data: foundUsers,
        ));
      }
    });
  }
}
