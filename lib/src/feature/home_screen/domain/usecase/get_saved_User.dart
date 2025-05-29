import 'package:smart_cite/src/feature/home_screen/domain/entities/user_entity.dart';
import 'package:smart_cite/src/feature/home_screen/domain/repository/user_repository.dart';

import '../../config/usecase/usecase.dart';

class GetSavedUserUseCase implements Usecase<List<UserEntity>, void> {
  final UserRepository _userRepository;

  GetSavedUserUseCase(this._userRepository);

  @override
  Future<List<UserEntity>> call({void params}) {
    return _userRepository.getSavedUser();
  }
}