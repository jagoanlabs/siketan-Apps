import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'berita_event.dart';
part 'berita_state.dart';

class BeritaBloc extends Bloc<BeritaEvent, BeritaState> {
  BeritaBloc() : super(BeritaInitial()) {
    on<BeritaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
