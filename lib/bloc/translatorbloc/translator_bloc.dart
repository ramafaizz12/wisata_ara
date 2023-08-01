import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:translator/translator.dart';

part 'translator_event.dart';
part 'translator_state.dart';

class TranslatorBloc extends Bloc<TranslatorEvent, String> {
  TranslatorBloc() : super('') {
    final translator = GoogleTranslator();
    on<TranslatorEvent>((event, emit) async {
      if (event is TranslatorLang) {
        var translater =
            await translator.translate(event.teks, to: event.kodebahasa);
        emit(translater.toString());
      }
    });
  }
}
