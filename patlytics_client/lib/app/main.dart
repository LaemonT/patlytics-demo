import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:patlytics_client/app/di/injector.dart';
import 'package:patlytics_client/app/routes/app_routes.dart';
import 'package:patlytics_client/core/service/app_service.dart';
import 'package:uuid/uuid.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await AppInjector.init();

  initSession();

  runApp(const MyApp());
}

void initSession() {
  final appService = AppInjector.instance<AppService>();
  if (appService.sessionId == null) {
    appService.setSessionId(const Uuid().v4());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Patlytics Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      routerConfig: AppRoute.goRouter,
    );
  }
}
