import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clasesegundocorte/presentation/providers/theme_provider.dart';
import 'package:clasesegundocorte/presentation/providers/theme_provider.dart';

class ChangeTheme extends ConsumerWidget {
  static const name = 'change-theme';
  const ChangeTheme({super.key});
  @override
  Widget build(BuildContext context, ref) {
    // final theme = ref.watch(themeProvider);
    final theme = ref.watch(themNotifierProvider).theme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
        actions: [
          IconButton(
              onPressed: () {
                // ref.read(themeProvider.notifier).update((state) => !state);
                ref.read(themNotifierProvider.notifier).toggleDarkMode();
              },
              icon: Icon(theme ? Icons.dark_mode : Icons.light_mode))
        ],
      ),
      body: _ThemeChange(),
    );
  }
}

class _ThemeChange extends ConsumerWidget {
  const _ThemeChange({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int value = ref.watch(selectColorProvider);

    final int value = ref.watch(themNotifierProvider).selectedColor;

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
            title: Text(
              "Color :",
              style: TextStyle(color: color),
            ),
            activeColor: color,
            subtitle: Text('${color.value}'),
            value: index,
            groupValue: value,
            onChanged: (value) {
              ref.read(themNotifierProvider.notifier).changeColorIndex(index);
            },
          );
        });
  }
}
