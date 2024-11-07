import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:patlytics_client/core/app_config.dart';
import 'package:patlytics_client/feature/infringement/data/datasource/remote/analysis_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClientModule {
  ApiClientModule._();

  static void init(GetIt injector) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://${AppConfig.host}',
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          request: false,
        ),
      );
    }

    injector.registerLazySingleton<Dio>(
      () => dio,
    );

    injector.registerLazySingleton<AnalysisApi>(
      () => AnalysisApi.create(
        injector(),
      ),
    );
  }
}
