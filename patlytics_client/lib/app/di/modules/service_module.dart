import 'package:get_it/get_it.dart';
import 'package:patlytics_client/core/service/app_service.dart';

class ServiceModule {
  ServiceModule._();

  static void init(GetIt injector) {
    injector.registerSingleton<AppService>(
      AppService(),
      signalsReady: true,
    );
  }
}
