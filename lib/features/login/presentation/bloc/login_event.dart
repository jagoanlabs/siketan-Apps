part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginProcessing extends LoginEvent {
  final LoginPayloadModel payload;

  const LoginProcessing({required this.payload});

  @override
  List<Object> get props => [payload];
}

