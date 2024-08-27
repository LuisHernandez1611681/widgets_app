import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutable (Nunca va cambiar)
final colorListProvider = Provider((ref) => colorList);

// Un simple Int
final selectedColorProvider = StateProvider((ref) => 0);