import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/locator.dart';
import '../../../shared/services/secure_storage.dart';
import '../../auth/model/user_model.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SecureStorage _secureStorage;

  //ProfileCubit() : super(const ProfileState.initial());
  ProfileCubit({
    SecureStorage? secureStorage,
  })  : _secureStorage = secureStorage ?? locator<SecureStorage>(),
        super(const ProfileState.initial());

  Future<void> getProfile() async {
    emit(const ProfileState.loading());
    try {
      Profiles? user = await _secureStorage.getUser();
      if (user!=null) {
        emit(ProfileState.success(
            user: user));
      } else {
        emit(const ProfileState.error(message: 'Une erreur est survenue'));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(const ProfileState.error(message: 'Une erreur est survenue'));
    }
  }
}
