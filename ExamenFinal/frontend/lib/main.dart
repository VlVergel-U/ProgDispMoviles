import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/config/router/app_router.dart';
import 'package:frontend/presentation/providers/theme_provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider).themeData;

    return MaterialApp.router(
      routerConfig: appRouter,
      title: "Spotify",
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
