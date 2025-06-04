part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success({required Profiles user}) = _Success;
  const factory AuthState.error({required String error}) = _Error;
  const factory AuthState.notConnected() = _NotConnected;
}
