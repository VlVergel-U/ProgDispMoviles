import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => true);

final themeNotifierProvider =
StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier(true));

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier(bool initialTheme) : super(AppTheme(isDarkMode: initialTheme));

  void toggleDarkMode() {
    state = AppTheme(isDarkMode: !state.isDarkMode);
  }
}
