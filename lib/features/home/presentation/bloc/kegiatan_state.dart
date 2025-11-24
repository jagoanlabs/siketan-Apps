part of 'kegiatan_bloc.dart';

sealed class KegiatanState extends Equatable {
  const KegiatanState();

  @override
  List<Object> get props => [];
}

final class KegiatanInitial extends KegiatanState {}

final class KegiatanLoading extends KegiatanState {}

final class KegiatanLoaded extends KegiatanState {
  final KegiatanPetaniResponseModel kegiatan;
  const KegiatanLoaded({required this.kegiatan});
}

final class KegiatanError extends KegiatanState {
  final String message;
  const KegiatanError({required this.message});
  @override
  List<Object> get props => [message];
}
