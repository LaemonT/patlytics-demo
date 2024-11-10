import 'package:get_it/get_it.dart';
import 'package:patlytics_client/app/di/modules/api_client_module.dart';
import 'package:patlytics_client/app/di/modules/bloc_module.dart';
import 'package:patlytics_client/app/di/modules/repository_module.dart';
import 'package:patlytics_client/app/di/modules/service_module.dart';

class AppInjector {
  AppInjector._();
  static GetIt instance = GetIt.instance;

  static Future<void> init() async {
    ServiceModule.init(instance);
    ApiClientModule.init(instance);
    RepositoryModule.init(instance);
    BlocModule.init(instance);

    await instance.allReady();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
