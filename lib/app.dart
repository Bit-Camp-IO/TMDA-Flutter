import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/config/theme/theme_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/injection_container.dart';
import 'package:tmda/route_observer.dart';

import 'generated/l10n.dart';

class TmdaApp extends StatefulWidget {
  static late S tr;
  static late BuildContext mainContext;
  const TmdaApp({super.key});

  @override
  State<TmdaApp> createState() => _TmdaAppState();
}

class _TmdaAppState extends State<TmdaApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: getIt<AppRouter>().config(
          navigatorObservers: () => [MyRouteObserver(), AutoRouteObserver()],
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateTitle: (context) {
          TmdaApp.tr = context.tr;
          return TmdaApp.tr.appName;
        },
        locale: Locale("en"),
        theme: ThemeManager.defaultTheme(),
      ),
    );
  }
}
