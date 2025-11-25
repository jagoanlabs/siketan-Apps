part of 'landing_statistik_bloc.dart';

sealed class LandingStatistikEvent extends Equatable {
  const LandingStatistikEvent();

  @override
  List<Object> get props => [];
}

final class LandingStatistikFetchEvent extends LandingStatistikEvent {
  const LandingStatistikFetchEvent();
}
