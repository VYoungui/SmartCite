
import '../../../../config/usecase/usecase.dart';
import '../../../../config/util/password_encryption.dart';
import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class SaveUserCase implements Usecase <void, UserEntity> {
  final UserRepository _userRepository;
  final PasswordEncoder _passwordEncoder;

  SaveUserCase(
      this._userRepository,
      this._passwordEncoder
      );

  @override
  Future<void> call({UserEntity? params}) {
    if (params == null) {
      throw ArgumentError('params cannot be null');
    }

    final securedUser = params.copyWith(
      password: _passwordEncoder.encode(params.password),
    );

    return _userRepository.saveUser(securedUser);
  }

}