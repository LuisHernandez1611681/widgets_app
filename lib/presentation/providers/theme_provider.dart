import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

/*
  Porvider: Para valores inmutables
  StateProvider: Mantener una pieza de estado
  StateNotifierProvider: 
*/

// Un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutable (Nunca va cambiar)
final colorListProvider = Provider((ref) => colorList);

// Un simple Int
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

//  Controller o Notifier
// Se va encargar de mantener un estado en particular
class ThemeNotifier extends StateNotifier<AppTheme> {
  // Se crea una nueva instancia de AppTheme
  // se utiliza con state para poder acceder a sus propiedades
  // ThemeNotifier(super._state);
  ThemeNotifier(): super(AppTheme());

}