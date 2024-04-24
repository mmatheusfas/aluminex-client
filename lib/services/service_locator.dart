import 'package:aluminex_client/core/env.dart';
import 'package:aluminex_core/aluminex_core.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<RestClient>(RestClient(Env.backendBaseUrl));
}
