import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  }

  Future<void> appStart(
    AppStartEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final onboardingDone = authRepository.isOnboardingCompleted();

    if (!onboardingDone) {
      emit(AuthenticationFirstTime()); // user harus onboarding
      return;
    }

    final token = await authRepository.getToken();

    if (token == null) {
      emit(AuthenticationFalse()); // ke login
    } else {
      emit(AuthenticationTrue()); // ke home
    }
  }

  Future<void> logout(
    LogoutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(LogoutProcess());
    try {
      await authRepository.logout();
      emit(AuthenticationFalse()); // kembali login
    } catch (e) {
      emit(LogoutFailed(e.toString()));
    }
  }
}
