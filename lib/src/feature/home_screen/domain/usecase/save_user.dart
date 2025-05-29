import '../../config/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class SaveUserCase implements Usecase<void, UserEntity> {
  final UserRepository _userRepository;

  SaveUserCase(this._userRepository);

  @override
  Future<void> call({UserEntity? params}) {
    return _userRepository.saveUser(params!);
  }
}