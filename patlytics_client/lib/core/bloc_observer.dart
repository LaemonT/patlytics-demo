import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patlytics_client/core/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    AppLogger.instance.i('BLoC: ${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    AppLogger.instance.i('Event: ${event.runtimeType} added');
    super.onEvent(bloc, event);
  }
}
