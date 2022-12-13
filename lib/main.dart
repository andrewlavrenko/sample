import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample/routes/router.gr.dart';

import 'core/injectable/injectable_init.dart';
import 'generated/colors.gen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

final AppRouter _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        scaffoldBackgroundColor: ColorName.white,
        fontFamily: 'Roboto',
      ),
    );
  }
}
