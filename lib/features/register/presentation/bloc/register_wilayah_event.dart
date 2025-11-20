part of 'register_wilayah_bloc.dart';

sealed class RegisterWilayahEvent extends Equatable {
  const RegisterWilayahEvent();

  @override
  List<Object> get props => [];
}

class GetAllKecamatanEvent extends RegisterWilayahEvent {}

class GetDesaByKecamatanEvent extends RegisterWilayahEvent {
  final int kecamatanId;
  const GetDesaByKecamatanEvent(this.kecamatanId);
}
