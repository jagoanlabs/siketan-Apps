abstract class AuthRepository {
  Future<bool> setOnboardingCompleted();
  bool isOnboardingCompleted();
  Future<void> clearOnboardingStatus();
  Future<void> logout();
  Future<String?> getToken();
}
