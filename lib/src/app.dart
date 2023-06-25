import 'package:dynamic_color/dynamic_color.dart';
import 'package:files_explore/src/pages/home/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mmkv/mmkv.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

/// The Widget that configures your application.
class _MyApp extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    final rootDir = await MMKV.initialize();
    print("rootDir:" + rootDir);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return _isLoading
        ? Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 4,
              ),
              width: 100,
              height: 100,
            ),
          )
        : DynamicColorBuilder(
            builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            return MaterialApp.router(
              restorationScopeId: 'app',
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,
              theme: ThemeData.light(useMaterial3: true)
                  .copyWith(colorScheme: lightDynamic),
              darkTheme: ThemeData.dark(useMaterial3: true)
                  .copyWith(colorScheme: darkDynamic),
              routerConfig: GoRouter(
                initialLocation: "/",
                routes: [
                  GoRoute(
                    path: '/',
                    builder: (_, state) {
                      return const Home();
                    },
                    routes: [
                      // GoRoute(
                      //   path: 'guide',
                      //   builder: (_, __) => const GuidePage(),
                      // ),
                    ],
                  )
                ],
              ),
            );
          });
  }
}
