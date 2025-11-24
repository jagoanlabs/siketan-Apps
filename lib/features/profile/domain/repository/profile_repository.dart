import 'package:siketan/features/profile/domain/model/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel?> getUserProfile();
}