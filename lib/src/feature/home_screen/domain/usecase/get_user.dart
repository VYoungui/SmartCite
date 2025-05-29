import 'package:smart_cite/src/feature/home_screen/config/ressources/data_state.dart';
import 'package:smart_cite/src/feature/home_screen/config/usecase/usecase.dart';
import 'package:smart_cite/src/feature/home_screen/domain/entities/user_entity.dart';

import '../repository/user_repository.dart';

class GetUserUseCase
  implements Usecase<DataState<List<UserEntity>>, void> {

  final UserRepository userRepository;
  GetUserUseCase(this.userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({void params}) {
    return userRepository.getNewUser();
  }

}