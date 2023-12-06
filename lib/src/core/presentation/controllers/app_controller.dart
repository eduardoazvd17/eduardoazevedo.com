import 'package:mobx/mobx.dart';

import '../../data/enums/supported_languages.dart';
import '../../data/enums/supported_themes.dart';
part 'app_controller.g.dart';

class AppController = AppControllerBase with _$AppController;

abstract class AppControllerBase with Store {
  @observable
  SupportedLanguages? _selectedLanguage;
  SupportedLanguages? get selectedLanguage => _selectedLanguage;
  void changeLanguage(SupportedLanguages? language) {
    _selectedLanguage = language;
  }

  @observable
  SupportedThemes _selectedTheme = SupportedThemes.system;
  SupportedThemes get selectedTheme => _selectedTheme;
  void changeTheme(SupportedThemes? theme) {
    if (theme != null) {
      _selectedTheme = theme;
    }
  }
}
