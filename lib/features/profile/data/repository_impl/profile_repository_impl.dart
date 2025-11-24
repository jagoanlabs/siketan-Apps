import 'package:siketan/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:siketan/features/profile/domain/model/profile_model.dart';
import 'package:siketan/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepositoryImpl({required this.profileLocalDataSource});

  @override
  Future<ProfileModel?> getUserProfile() async {
    try {
      final userData = profileLocalDataSource.getUserData();

      // Check if we have any user data
      if (userData['id'] == null) {
        return null; // No user data available
      }

      return ProfileModel.fromSharedPreferences(userData);
    } catch (e) {
      // Handle any errors and return null
      return null;
    }
  }
}
