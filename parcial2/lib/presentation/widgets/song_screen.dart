import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:parcial2/presentation/providers/theme_provider.dart';

class SongScreen extends ConsumerStatefulWidget {
  const SongScreen({super.key});
  static const String name = 'SongScreen';

  @override
  ConsumerState<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends ConsumerState<SongScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider).themeData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.appBarTheme.iconTheme?.color),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      body: Column(
        children: [
          Text(
            "Hola",
            style: TextStyle(color: theme.primaryColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.play_arrow, color: theme.iconTheme.color),
          ),
        ],
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }
}
