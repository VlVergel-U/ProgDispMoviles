import 'package:clasesegundocorte/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';


void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final theme = ref.watch(themeProvider);

    final AppTheme appTheme = ref.watch(themNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      title: "Flutter widget",
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      /* home: HomeScreen(),
      routes: {
        "/buttons": (context) => ButtonsScreen(),
        "/cards": (context) => CardScreen()
      },*/
    );
  }
}
