import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patlytics_client/feature/infringement/presentation/home_page.dart';
import 'package:patlytics_client/feature/infringement/presentation/result_page.dart';

class DefaultTransitionPage extends NoTransitionPage {
  const DefaultTransitionPage({required super.child});
}

class AppRoute {
  static const rootPath = '/';

  static final home = HomeRoute();

  static final goRouter = GoRouter(
    initialLocation: rootPath,
    routes: [
      home.goRoute,
    ],
  );
}

class HomeRoute {
  final String path = '/';

  final analysis = AnalysisRoute();

  late final goRoute = GoRoute(
    path: path,
    routes: [
      analysis.goRoute,
    ],
    builder: (BuildContext context, GoRouterState state) => const MyHomePage(),
  );
}

class AnalysisRoute {
  final String path = '/analysis';

  late final goRoute = GoRoute(
    path: path,
    builder: (BuildContext context, GoRouterState state) => const ResultPage(),
  );
}
