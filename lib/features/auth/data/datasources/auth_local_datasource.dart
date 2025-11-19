import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences prefs;

  AuthLocalDataSource(this.prefs);

  static const String _onboardingKey = 'onboarding_completed';

  /// Set onboarding completed = true
  Future<bool> setOnboardingCompleted() async {
    return prefs.setBool(_onboardingKey, true);
  }

  /// Check apakah onboarding sudah selesai
  bool isOnboardingCompleted() {
    return prefs.getBool(_onboardingKey) ?? false;
  }

  /// Hapus status onboarding (optional)
  Future<void> clearOnboardingStatus() async {
    await prefs.remove(_onboardingKey);
  }
}
