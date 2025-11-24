part of 'berita_bloc.dart';

sealed class BeritaState extends Equatable {
  const BeritaState();
  
  @override
  List<Object> get props => [];
}

final class BeritaInitial extends BeritaState {}
