import 'package:eduardoazevedo/src/core/data/services/storage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../data/enums/supported_languages.dart';
import '../../data/enums/supported_themes.dart';
part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  final StorageService _storage = GetIt.I.get<StorageService>();
  Future<void> init() async {
    _selectedLanguage = await _storage.loadLanguage();
    _selectedTheme = await _storage.loadTheme();
  }

  @observable
  SupportedLanguages? _selectedLanguage;
  SupportedLanguages? get selectedLanguage => _selectedLanguage;
  void changeLanguage(SupportedLanguages? language) {
    if (language == SupportedLanguages.system) {
      _selectedLanguage = null;
      _storage.saveLanguage(null);
    } else {
      _selectedLanguage = language;
      _storage.saveLanguage(language);
    }
  }

  @observable
  SupportedThemes _selectedTheme = SupportedThemes.system;
  SupportedThemes get selectedTheme => _selectedTheme;
  void changeTheme(SupportedThemes? theme) {
    if (theme != null) {
      _selectedTheme = theme;
      _storage.saveTheme(theme);
    }
  }
}
