part of 'berita_bloc.dart';

sealed class BeritaState extends Equatable {
  const BeritaState();

  @override
  List<Object> get props => [];
}

final class BeritaInitial extends BeritaState {}

final class BeritaLoading extends BeritaState {}

final class BeritaLoaded extends BeritaState {
  final BeritaPetaniResponseModel berita;
  const BeritaLoaded({required this.berita});
}

final class BeritaError extends BeritaState {
  final String message;
  const BeritaError({required this.message});
  @override
  List<Object> get props => [message];
}
