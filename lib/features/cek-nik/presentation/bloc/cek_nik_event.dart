part of 'cek_nik_bloc.dart';

sealed class CekNikEvent extends Equatable {
  const CekNikEvent();

  @override
  List<Object> get props => [];
}

final class CekNikEventPostCekNik extends CekNikEvent {
  final CekNikPayloadModel payload;
  const CekNikEventPostCekNik({required this.payload});

  @override
  List<Object> get props => [payload];
}
