part of 'kegiatan_bloc.dart';

sealed class KegiatanEvent extends Equatable {
  const KegiatanEvent();

  @override
  List<Object> get props => [];
}

final class KegiatanEventFetch extends KegiatanEvent {
  const KegiatanEventFetch();
}
