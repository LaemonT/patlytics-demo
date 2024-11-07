import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patlytics_client/home_page.dart';

class DefaultTransitionPage extends NoTransitionPage {
  const DefaultTransitionPage({required super.child});
}

class AppRoute {
  static const rootPath = '/';
  static String get _validatedRootPath => rootPath == '/' ? '' : rootPath;

  static final home = HomeRoute(_validatedRootPath);
  static final infringement = AnalysisRoute(_validatedRootPath);

  static final goRouter = GoRouter(
    initialLocation: rootPath,
    routes: [
      home.goRoute,
      infringement.goRoute,
    ],
  );
}

class RootRoute {
  final String _path;
  final List<RouteBase> routes;

  RootRoute(this._path, this.routes);

  late final GoRoute goRoute = GoRoute(
    path: _path,
    routes: routes,
    redirect: (BuildContext context, GoRouterState state) async {
      // Redirects the root path to the dashboard
      if (state.fullPath == AppRoute.rootPath) {
        return AppRoute.home.path();
      }
      // Continue without redirect
      return null;
    },
  );
}

class HomeRoute {
  static const String _name = '/';
  final String _path;

  final goRoute = GoRoute(
    path: _name,
    builder: (BuildContext context, GoRouterState state) => const MyHomePage(),
  );

  HomeRoute(String parentPath) : _path = '$parentPath/$_name';

  String path() => _path;
}

class AnalysisRoute {
  static const String _name = 'analysis';
  final String _path;

  final goRoute = GoRoute(
    path: _name,
    builder: (BuildContext context, GoRouterState state) => const MyHomePage(),
  );

  AnalysisRoute(String parentPath) : _path = '$parentPath/$_name';

  String path() => _path;
}
