import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:patlytics_client/core/bloc_observer.dart';
import 'package:patlytics_client/feature/infringement/presentation/bloc/analysis_bloc.dart';

class BlocModule {
  BlocModule._();

  static void init(GetIt injector) {
    Bloc.observer = AppBlocObserver();

    injector.registerFactory<AnalysisBloc>(
      () => AnalysisBloc(
        injector(),
      ),
    );
  }
}
