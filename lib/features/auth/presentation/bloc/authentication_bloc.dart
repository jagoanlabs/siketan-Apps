import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/auth/domain/repository/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationBloc({required this.authRepository})
    : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<AppStartEvent>(appStart);

    on<ResetState>((event, emit) {
      emit(AuthenticationInitial());
    });

    on<OnBoardingDoneEvent>((event, emit) async {
      await authRepository.setOnboardingCompleted();
      emit(AuthenticationFalse()); // lanjut ke login
    });

    on<LogoutEvent>(logout);

    on<LoginSuccessEvent>((event, emit) {
      emit(AuthenticationTrue());
    });
  }

  Future<void> appStart(
    AppStartEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    logger.d('App Start');
    final onboardingDone = authRepository.isOnboardingCompleted();

    logger.d('onboardingDone $onboardingDone');
    if (!onboardingDone) {
      logger.d('User harus onboarding');
      emit(AuthenticationFirstTime()); // user harus onboarding
      return;
    }

    final token = await authRepository.getToken();
    logger.d('token $token');

    if (token == null) {
      logger.d('User belum login');
      emit(AuthenticationFalse()); // ke login
    } else {
      logger.d('User sudah login');
      emit(AuthenticationTrue()); // ke home
    }
  }

  Future<void> logout(
    LogoutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    logger.d('Logout');
    emit(LogoutProcess());
    try {
      await authRepository.logout();
      emit(AuthenticationFalse()); // kembali login
    } catch (e) {
      logger.e('Logout Failed $e');
      emit(LogoutFailed(handleAppError(e)));
    }
  }
}
