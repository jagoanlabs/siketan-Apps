part of 'landing_statistik_bloc.dart';

sealed class LandingStatistikState extends Equatable {
  const LandingStatistikState();

  @override
  List<Object> get props => [];
}

final class LandingStatistikInitial extends LandingStatistikState {}

final class LandingStatistikLoading extends LandingStatistikState {}

final class LandingStatistikLoaded extends LandingStatistikState {
  final LandingStatstikResponseModel data;
  const LandingStatistikLoaded({required this.data});
}

final class LandingStatistikError extends LandingStatistikState {
  final String message;
  const LandingStatistikError({required this.message});
}
