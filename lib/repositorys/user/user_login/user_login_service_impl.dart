import 'package:aluminex_client/repositorys/user/user_login_respository_impl.dart';
import 'package:aluminex_core/aluminex_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/service_locator.dart';
import './user_login_service.dart';

class UserLoginServiceImpl implements UserLoginService {
  final userRepository = UserLoginRespositoryImpl(restClient: getIt.get<RestClient>());

  @override
  Future<Either<ServiceException, Unit>> execute(String email, String password) async {
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      case Left(value: AuthUnauthorizedException()):
        return Left(ServiceException(message: 'Email ou senha inválidos'));
      case Left(value: AuthError()):
        return Left(ServiceException(message: 'Erro ao realizar login'));
      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageConstants.accessToken, accessToken);
        return Right(unit);
    }
  }
}
