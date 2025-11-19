import 'package:siketan/features/login/domain/model/login_response_model.dart'
    show LoginResponseModel;
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalDataSource {
  final SharedPreferences prefs;

  LoginLocalDataSource(this.prefs);

  static const String _isUserLoggedInKey = 'is_user_logged_in';

  // User-related keys (from LoginResponseModel's User)
  static const String _userEmailKey = 'user_email';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _userNoWaKey = 'user_no_wa';
  static const String _userPekerjaanKey = 'user_pekerjaan';
  static const String _userPeranKey = 'user_peran';
  static const String _userFotoKey = 'user_foto';
  static const String _userAccountIdKey = 'user_account_id';
  static const String _userIsVerifiedKey = 'user_is_verified';
  static const String _userRoleIdKey = 'user_role_id';
  static const String _userCreatedAtKey = 'user_created_at';
  static const String _userUpdatedAtKey = 'user_updated_at';
  static const String _userRoleNameKey = 'user_role_name';
  static const String _userRoleDisplayNameKey = 'user_role_display_name';
  static const String _userRoleDescriptionKey = 'user_role_description';


  Future<bool> setIsUserLoggedIn(bool isLoggedIn) async {
    return await prefs.setBool('is_user_logged_in', isLoggedIn);
  }

  bool? isUserLoggedIn() {
    return prefs.getBool('is_user_logged_in');
  }

  // Store user data from LoginResponseModel (excluding token and password)
  Future<bool> storeUserDataFromResponse(LoginResponseModel response) async {
    final user = response.user;
    if (user == null) return false;

    // Store user data and return true only if all operations succeed
    bool success = true;

    success &= await prefs.setString(_userEmailKey, user.email ?? '');
    success &= await prefs.setInt(_userIdKey, user.id?.toInt() ?? 0);
    success &= await prefs.setString(_userNameKey, user.nama ?? '');
    success &= await prefs.setString(_userNoWaKey, user.noWa ?? '');
    success &= await prefs.setString(_userPekerjaanKey, user.pekerjaan ?? '');
    success &= await prefs.setString(_userPeranKey, user.peran ?? '');
    success &= await prefs.setString(_userFotoKey, user.foto ?? '');
    success &= await prefs.setString(_userAccountIdKey, user.accountId ?? '');
    success &= await prefs.setBool(_userIsVerifiedKey, user.isVerified ?? false);
    success &= await prefs.setInt(_userRoleIdKey, user.roleId ?? 0);

    // Store user role data if available
    if (user.role != null) {
      success &= await prefs.setString(_userRoleNameKey, user.role?.name ?? '');
      success &= await prefs.setString(_userRoleDisplayNameKey, user.role?.displayName ?? '');
      success &= await prefs.setString(_userRoleDescriptionKey, user.role?.description ?? '');
    }

    // Store timestamp
    success &= await prefs.setString(_userCreatedAtKey, user.createdAt?.toIso8601String() ?? '');
    success &= await prefs.setString(_userUpdatedAtKey, user.updatedAt?.toIso8601String() ?? '');

    // Mark user as logged in
    success &= await prefs.setBool(_isUserLoggedInKey, true);

    return success;
  }

  // Get user data as a map
  Map<String, dynamic> getUserData() {
    return {
      'email': getUserEmail(),
      'id': getUserId(),
      'name': getUserName(),
      'noWa': getUserNoWa(),
      'pekerjaan': getUserPekerjaan(),
      'peran': getUserPeran(),
      'foto': getUserFoto(),
      'accountId': getUserAccountId(),
      'isVerified': getUserIsVerified(),
      'roleId': getUserRoleId(),
      'createdAt': getUserCreatedAt(),
      'updatedAt': getUserUpdatedAt(),
      'roleName': getUserRoleName(),
      'roleDisplayName': getUserRoleDisplayName(),
      'roleDescription': getUserRoleDescription(),
      'isLoggedIn': isUserLoggedIn() ?? false,
    };
  }

  // Individual user data getters
  String? getUserEmail() {
    final value = prefs.getString(_userEmailKey);
    return value != '' ? value : null;
  }

  int? getUserId() {
    final value = prefs.getInt(_userIdKey);
    return value != 0 ? value : null;
  }

  String? getUserName() {
    final value = prefs.getString(_userNameKey);
    return value != '' ? value : null;
  }

  String? getUserNoWa() {
    final value = prefs.getString(_userNoWaKey);
    return value != '' ? value : null;
  }

  String? getUserPekerjaan() {
    final value = prefs.getString(_userPekerjaanKey);
    return value != '' ? value : null;
  }

  String? getUserPeran() {
    final value = prefs.getString(_userPeranKey);
    return value != '' ? value : null;
  }

  String? getUserFoto() {
    final value = prefs.getString(_userFotoKey);
    return value != '' ? value : null;
  }

  String? getUserAccountId() {
    final value = prefs.getString(_userAccountIdKey);
    return value != '' ? value : null;
  }

  bool? getUserIsVerified() {
    return prefs.getBool(_userIsVerifiedKey);
  }

  int? getUserRoleId() {
    final value = prefs.getInt(_userRoleIdKey);
    return value != 0 ? value : null;
  }

  DateTime? getUserCreatedAt() {
    final value = prefs.getString(_userCreatedAtKey);
    return value != null && value != '' ? DateTime.tryParse(value) : null;
  }

  DateTime? getUserUpdatedAt() {
    final value = prefs.getString(_userUpdatedAtKey);
    return value != null && value != '' ? DateTime.tryParse(value) : null;
  }

  String? getUserRoleName() {
    final value = prefs.getString(_userRoleNameKey);
    return value != '' ? value : null;
  }

  String? getUserRoleDisplayName() {
    final value = prefs.getString(_userRoleDisplayNameKey);
    return value != '' ? value : null;
  }

  String? getUserRoleDescription() {
    final value = prefs.getString(_userRoleDescriptionKey);
    return value != '' ? value : null;
  }

  // Clear all auth-related data
  Future<bool> clearAuthData() async {
    bool success = true;

    success &= await prefs.remove(_userEmailKey);
    success &= await prefs.remove(_userIdKey);
    success &= await prefs.remove(_userNameKey);
    success &= await prefs.remove(_userNoWaKey);
    success &= await prefs.remove(_userPekerjaanKey);
    success &= await prefs.remove(_userPeranKey);
    success &= await prefs.remove(_userFotoKey);
    success &= await prefs.remove(_userAccountIdKey);
    success &= await prefs.remove(_userIsVerifiedKey);
    success &= await prefs.remove(_userRoleIdKey);
    success &= await prefs.remove(_userCreatedAtKey);
    success &= await prefs.remove(_userUpdatedAtKey);
    success &= await prefs.remove(_userRoleNameKey);
    success &= await prefs.remove(_userRoleDisplayNameKey);
    success &= await prefs.remove(_userRoleDescriptionKey);
    success &= await prefs.remove(_isUserLoggedInKey);

    return success;
  }

  // Check if user has auth data
  bool hasAuthData() {
    final isLoggedIn = isUserLoggedIn();
    final userId = getUserId();

    return isLoggedIn == true && userId != null;
  }
}
