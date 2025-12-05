import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/register/domain/model/register_payload_model.dart';
import 'package:siketan/features/register/domain/model/register_response_model.dart';
import 'package:siketan/features/register/domain/repository/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository registerRepository;
  RegisterBloc({required this.registerRepository}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    on<RegisterProccess>(_registerProccess);
  }

  Future<void> _registerProccess(
    RegisterProccess event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      final data = await registerRepository.register(event.payload);
      emit(RegisterSuccess(data));
    } catch (e) {
      emit(RegisterFailed(handleAppError(e)));
    }
  }
}
