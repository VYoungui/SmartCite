import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_cite/src/feature/auth/model/user_model.dart';
import 'package:smart_cite/src/feature/auth/repositories/auth_repository.dart';
import 'package:smart_cite/src/shared/model/reponse_entity.dart';

import '../../../shared/locator.dart';
import '../../../shared/services/secure_storage.dart';
import '../../dto/request/login_request.dart';
import '../../dto/request/register_request.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository = AuthRepository();
  final SecureStorage _secureStorage;
  //AuthCubit() : super(const AuthState.initial());
  AuthCubit({
    SecureStorage? secureStorage,
  })  : _secureStorage = secureStorage ?? locator<SecureStorage>(),
        super(const AuthState.initial());

  Future<void> login(LoginRequest loginRequest) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(const AuthState.notConnected());
    } else {
      emit(const AuthState.loading());
      try {
        ResponseEntity responseEntity =
            await authRepository.login(loginRequest);
        print(responseEntity);
        _secureStorage.saveAccessToken(responseEntity.data!.accessToken);
        _secureStorage.saveRefreshToken(responseEntity.data.refreshToken!);
        if (responseEntity.success) {
          print(responseEntity.data.user.id);
          Profiles user =
              await authRepository.getUser(responseEntity.data.user.id);
          _secureStorage.saveUser(user);
          _secureStorage.saveRole(user.role);
          emit(AuthState.success(
              user: user));
        } else {
          emit(AuthState.error(error: responseEntity.message));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(const AuthState.error(error: 'Une erreur est survenue'));
      }
    }
  }

  Future<void> register(RegisterRequest registerRequest) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(const AuthState.notConnected());
    } else {
      emit(const AuthState.loading());
      try {
        ResponseEntity responseEntity =
            await authRepository.register(registerRequest);
        print(responseEntity);
        if (responseEntity.success) {
          Profiles user =
          await authRepository.getUser(responseEntity.data.user.id);
          print(responseEntity.data.user.id);
          _secureStorage.saveUser(user);
          _secureStorage.saveRole(user.role);
          emit(AuthState.success(
              user: user));
        } else {
          emit(AuthState.error(error: responseEntity.message));
          //emit(const AuthState.error(error: 'Identifiants incorrects'));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(const AuthState.error(error: 'Une erreur est survenue'));
      }
    }
  }
}
