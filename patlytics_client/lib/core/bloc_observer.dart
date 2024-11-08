import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patlytics_client/core/app_logger.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    AppLogger.instance.i('${bloc.runtimeType}.onCreate (${bloc.hashCode})');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    AppLogger.instance.i('${bloc.runtimeType}.onEvent (${bloc.hashCode})');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    AppLogger.instance.i('${bloc.runtimeType}.onChange (${bloc.hashCode})');
  }

  @override
  void onClose(BlocBase bloc) {
    AppLogger.instance.i('${bloc.runtimeType}.onClose (${bloc.hashCode})');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogger.instance.i('${bloc.runtimeType}.onError (${bloc.hashCode})');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    AppLogger.instance.i('${bloc.runtimeType}.onTransition (${bloc.hashCode})');
  }
}
