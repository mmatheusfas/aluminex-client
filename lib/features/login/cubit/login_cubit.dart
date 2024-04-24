import 'package:aluminex_client/features/login/cubit/login_cubit_states.dart';
import 'package:aluminex_core/aluminex_core.dart';
import 'package:bloc/bloc.dart';

import '../../../repositorys/user/user_login/user_login_service.dart';
import '../../../repositorys/user/user_login/user_login_service_impl.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final UserLoginService _loginService = UserLoginServiceImpl();

  LoginCubit() : super(LoginInitialState());

  void loginUser({required String email, required String password}) async {
    emit(LoginLoadingState());
    final loginResult = await _loginService.execute(email, password);

    switch (loginResult) {
      case Left(value: ServiceException(:final message)):
        emit(LoginErrorState(message: message));
      case Right(value: _):
        emit(LoginLoggedState());
    }
  }
}
