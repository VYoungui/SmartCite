import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../locator.dart';
import '../../services/secure_storage.dart';

part 'bootstrap_state.dart';
part 'bootstrap_cubit.freezed.dart';

class BootstrapCubit extends Cubit<BootstrapState> {
  final SecureStorage _secureStorage;

  BootstrapCubit({
    SecureStorage? secureStorage,
  })  : _secureStorage = secureStorage ?? locator<SecureStorage>(),
        super(const BootstrapState.initial());

  void init() async {
    final accessToken = await _secureStorage.getAccessToken();
    final role = await _secureStorage.getRole();
    if (accessToken == null) {
      emit(const BootstrapState.initialized(isLoggedIn: false, role: ''));
      return;
    }
    if (role == null) {
      emit(const BootstrapState.initialized(isLoggedIn: true, role: ''));
      return;
    }
    emit(BootstrapState.initialized(isLoggedIn: true, role: role));
  }
}

