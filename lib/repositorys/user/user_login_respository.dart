import 'package:aluminex_core/aluminex_core.dart';

abstract interface class UserLoginRespository {
  Future<Either<AuthException, String>> login(String email, String password);
}
