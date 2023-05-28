import 'package:dynamic_color/dynamic_color.dart';
import 'package:files_explore/src/pages/home/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'pages/test/page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return DynamicColorBuilder(
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
                return TestHome(); // Home();
              },
              routes: [
                // GoRoute(
                //   path: 'guide',
                //   builder: (_, __) => const GuidePage(),
                // ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

/// A counter that is being incremented by each [CounterDisplay]'s ElevatedButton
final counterProvider = StateProvider(
  (ref) => 0,
);

final adjustedCountProvider = Provider(
  (ref) => ref.watch(counterProvider) * 2,
  // Note that if a provider depends on a provider that is overridden for a subtree,
  // you must explicitly list that provider in your dependencies list.
  dependencies: [counterProvider],
);

class HomeTest extends ConsumerWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      children: [
        ProviderScope(
          /// Just specify which provider you want to have a copy of in the subtree
          ///
          /// Note that dependant providers such as [adjustedCountProvider] will
          /// also be copied for this subtree. If that is not the behavior you want,
          /// consider using families instead
          overrides: [counterProvider],
          child: const CounterDisplay(),
        ),
        ProviderScope(
          // You can change the provider's behavior in a particular subtree
          overrides: [counterProvider.overrideWith((ref) => 1)],
          child: const CounterDisplay(),
        ),
        ProviderScope(
          overrides: [
            counterProvider,
            // You can also change dependent provider's behaviors
            adjustedCountProvider.overrideWith(
              (ref) => ref.watch(counterProvider) * 3,
            ),
          ],
          child: const CounterDisplay(),
        ),
        // This particular display will use the provider state from the root ProviderScope
        const CounterDisplay(),
      ],
    ));
  }
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$count'),
        ElevatedButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: const Text('Increment Count'),
        ),
      ],
    );
  }
}
