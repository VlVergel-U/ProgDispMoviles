import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clasesegundocorte/config/theme/app_theme.dart';

// provider que se modifica  una pieza
final themeProvider = StateProvider((ref) => true);

// provider que no se modifica
final colorListProvider = Provider((ref) => colorList);

final selectColorProvider = StateProvider((ref) => 3);

// object theme custom (para object o estados mas complicados)
final themNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  /// state va hacer igual quel appTheme
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(theme: !state.theme);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
