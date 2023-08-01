import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wisata_ara/Models/Meta.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  StatusBloc() : super(StatusInitial()) {
    on<StatusEvent>((event, emit) {
      if (event is InputStatus) {
        emit(StatusNow(data: event.status));
      }
    });
  }
}
