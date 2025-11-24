part of 'berita_bloc.dart';

sealed class BeritaEvent extends Equatable {
  const BeritaEvent();

  @override
  List<Object> get props => [];
}

final class BeritaEventFetch extends BeritaEvent {
  const BeritaEventFetch();
}
