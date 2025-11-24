import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDataSource {
  final SharedPreferences prefs;

  ProfileLocalDataSource(this.prefs);

  // User-related keys (same as in login local data source)
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
    };
  }

  // Individual user data getters
  String? getUserEmail() {
    final value = prefs.getString(_userEmailKey);
    return value != '' && value != null ? value : null;
  }

  int? getUserId() {
    final value = prefs.getInt(_userIdKey);
    return value != 0 ? value : null;
  }

  String? getUserName() {
    final value = prefs.getString(_userNameKey);
    return value != '' && value != null ? value : null;
  }

  String? getUserNoWa() {
    final value = prefs.getString(_userNoWaKey);
    return value != '' && value != null ? value : null;
  }

  String? getUserPekerjaan() {
    final value = prefs.getString(_userPekerjaanKey);
    return value != '' && value != null ? value : null;
  }

  String? getUserPeran() {
    final value = prefs.getString(_userPeranKey);
    return value != '' && value != null ? value : null;
  }

  String? getUserFoto() {
    final value = prefs.getString(_userFotoKey);
    return value != '' && value != null ? value : null;
  }

  String? getUserAccountId() {
    final value = prefs.getString(_userAccountIdKey);
    return value != '' && value != null ? value : null;
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
    return value != '' && value != null ? value : null;
  }

  String? getUserRoleDisplayName() {
    final value = prefs.getString(_userRoleDisplayNameKey);
    return value != '' && value != null ? value : null;
  }

  String? getUserRoleDescription() {
    final value = prefs.getString(_userRoleDescriptionKey);
    return value != '' && value != null ? value : null;
  }
}