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

final class RegisterPetaniProccess extends RegisterEvent {
    final RegisterPetaniPayloadModel payload;
    final File? fotoKtp;
    const RegisterPetaniProccess(this.payload, {this.fotoKtp});
    @override
    List<Object> get props => [payload, if (fotoKtp != null) fotoKtp!];
}