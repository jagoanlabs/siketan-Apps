import 'package:equatable/equatable.dart';
import 'package:siketan/features/profile/domain/model/profile_model.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfileEvent extends ProfileEvent {
  const LoadUserProfileEvent();
}
