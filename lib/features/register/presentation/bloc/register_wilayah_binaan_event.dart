part of 'register_wilayah_binaan_bloc.dart';

sealed class RegisterWilayahBinaanEvent extends Equatable {
  const RegisterWilayahBinaanEvent();

  @override
  List<Object> get props => [];
}

class LoadInitialWilayah extends RegisterWilayahBinaanEvent {}

class SelectKecamatanEvent extends RegisterWilayahBinaanEvent {
  final int kecamatanId;

  SelectKecamatanEvent(this.kecamatanId);
}

class SelectDesaEvent extends RegisterWilayahBinaanEvent {
  final int desaId;

  SelectDesaEvent(this.desaId);

  @override
  List<Object> get props => [desaId];
}

class SelectKelompokEvent extends RegisterWilayahBinaanEvent {
  final List<int> kelompokIds;
  SelectKelompokEvent(this.kelompokIds);
}
