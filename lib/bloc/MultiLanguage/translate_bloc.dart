import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:translator/translator.dart';

part 'translate_event.dart';
part 'translate_state.dart';

enum Bahasa { toenglish, toindo, torusia, tomalaysia }

class TranslateBloc extends Bloc<TranslateEvent, String> {
  TranslateBloc() : super('id') {
    final translator = GoogleTranslator();

    on<TranslateEvent>((event, emit) {
      if (event is InputArgumen) {
        emit(event.kodebahasa);
        // if (event is ToEnglish) {
        //   var translater = await translator.translate(event.value, to: 'en');
        //   print("keenglish");
        //   emit(TranslateLoaded(value: translater.toString()));
        // }
        // if (event is ToIndo) {
        //   var translater = await translator.translate(event.value, to: 'id');
        //   emit(TranslateLoaded(value: translater.toString()));
        // }
        // if (event is ToRusia) {
        //   var translater = await translator.translate(event.value, to: 'rus');
        //   emit(TranslateLoaded(value: translater.toString()));
        // }
        // if (event is Tomalaysia) {
        //   var translater = await translator.translate(event.value, to: 'ms');
        //   emit(TranslateLoaded(value: translater.toString()));
        // }
      }
    });
  }
}
