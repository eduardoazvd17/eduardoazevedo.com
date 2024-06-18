import 'package:eduardoazevedo/src/services/storage_service.dart';
import 'package:mobx/mobx.dart';

import '../enums/supported_languages.dart';
import '../enums/supported_themes.dart';
part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  final StorageService _storage;
  AppControllerBase({
    required StorageService storage,
  }) : _storage = storage {
    onInit();
  }

  Future<void> onInit() async {
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

  @observable
  double homePageScrollPosition = 0.0;
}
