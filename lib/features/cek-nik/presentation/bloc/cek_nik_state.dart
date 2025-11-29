part of 'cek_nik_bloc.dart';

sealed class CekNikState extends Equatable {
  const CekNikState();

  @override
  List<Object> get props => [];
}

final class CekNikInitial extends CekNikState {}

final class CekNikLoading extends CekNikState {}

final class CekNikProcessing extends CekNikState {
  final CekNikPayloadModel payload;
  const CekNikProcessing({required this.payload});
}

final class CekNikSuccess extends CekNikState {
  final CekNikResponseModel data;
  const CekNikSuccess({required this.data});
}

final class CekNikError extends CekNikState {
  final String message;
  const CekNikError({required this.message});
}
