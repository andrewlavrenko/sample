// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../features/sample/presentation/screens/sample_screen.dart' as _i2;
import '../features/sample/presentation/screens/sample_screen2.dart' as _i3;
import 'sample/sample_wrapper.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MajorRouter.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SampleWrapper(),
      );
    },
    SampleScreenRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SampleScreen(),
      );
    },
    SampleScreen2Route.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SampleScreen2(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MajorRouter.name,
          path: '/',
          children: [
            _i4.RouteConfig(
              SampleScreenRoute.name,
              path: '',
              parent: MajorRouter.name,
            ),
            _i4.RouteConfig(
              SampleScreen2Route.name,
              path: 'sample-screen2',
              parent: MajorRouter.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.SampleWrapper]
class MajorRouter extends _i4.PageRouteInfo<void> {
  const MajorRouter({List<_i4.PageRouteInfo>? children})
      : super(
          MajorRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MajorRouter';
}

/// generated route for
/// [_i2.SampleScreen]
class SampleScreenRoute extends _i4.PageRouteInfo<void> {
  const SampleScreenRoute()
      : super(
          SampleScreenRoute.name,
          path: '',
        );

  static const String name = 'SampleScreenRoute';
}

/// generated route for
/// [_i3.SampleScreen2]
class SampleScreen2Route extends _i4.PageRouteInfo<void> {
  const SampleScreen2Route()
      : super(
          SampleScreen2Route.name,
          path: 'sample-screen2',
        );

  static const String name = 'SampleScreen2Route';
}
