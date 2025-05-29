import 'package:smart_cite/src/feature/home_screen/domain/entities/user_entity.dart';

import '../../../../config/usecase/usecase.dart';
import '../repository/user_repository.dart';

class RemoveUserUseCase implements Usecase<void, UserEntity> {
  final UserRepository _userRepository;

  RemoveUserUseCase(this._userRepository);

  @override
  Future<void> call({UserEntity? params}) {
    return _userRepository.removeUser(params!);
  }
}