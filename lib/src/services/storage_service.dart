import 'package:eduardoazevedo/src/enums/supported_languages.dart';
import 'package:eduardoazevedo/src/enums/supported_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String selectedThemeKey = 'SelectedTheme';
  static const String selectedLanguageKey = 'SelectedLanguage';

  Future<void> saveTheme(SupportedThemes theme) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(selectedThemeKey, theme.index);
    } catch (_) {}
  }

  Future<SupportedThemes> loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? index = prefs.getInt(selectedThemeKey);
      if (index != null) {
        return SupportedThemes.values[index];
      } else {
        return SupportedThemes.system;
      }
    } catch (_) {
      return SupportedThemes.system;
    }
  }

  Future<void> saveLanguage(SupportedLanguages? language) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (language == null) {
        await prefs.remove(selectedLanguageKey);
      } else {
        await prefs.setInt(selectedLanguageKey, language.index);
      }
    } catch (_) {}
  }

  Future<SupportedLanguages?> loadLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return SupportedLanguages.values[prefs.getInt(selectedLanguageKey)!];
    } catch (_) {
      return null;
    }
  }
}
