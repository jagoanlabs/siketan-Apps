part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}
final class RegisterProccess extends RegisterEvent {
    final RegisterPaylaodModel payload;
    const RegisterProccess(this.payload);
    @override
    List<Object> get props => [payload];
}