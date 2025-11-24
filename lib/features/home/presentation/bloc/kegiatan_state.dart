part of 'kegiatan_bloc.dart';

sealed class KegiatanState extends Equatable {
  const KegiatanState();
  
  @override
  List<Object> get props => [];
}

final class KegiatanInitial extends KegiatanState {}
