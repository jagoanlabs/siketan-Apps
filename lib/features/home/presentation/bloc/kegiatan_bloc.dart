import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'kegiatan_event.dart';
part 'kegiatan_state.dart';

class KegiatanBloc extends Bloc<KegiatanEvent, KegiatanState> {
  KegiatanBloc() : super(KegiatanInitial()) {
    on<KegiatanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
