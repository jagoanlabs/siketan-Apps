import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/core/network/network_service.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/login/domain/model/login_payload_model.dart';
import 'package:siketan/features/login/domain/model/login_response_model.dart';
import 'package:siketan/features/login/domain/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<LoginProcessing>(loginProcessing);
  }

  Future<void> loginProcessing(
    LoginProcessing event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      logger.d("LoginProcessing ${event.payload}");
      final response = await loginRepository.login(event.payload);
      final token = response.token;
      final NetworkService networkService = getIt<NetworkService>();
      networkService.setToken(token ?? "");
      emit(LoginSuccess(data: response));
    } catch (e) {
      logger.e(e);
      emit(LoginFailure(message: e.toString()));
    }
  }
}
