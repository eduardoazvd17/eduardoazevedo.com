// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on AppControllerBase, Store {
  late final _$_selectedLanguageAtom =
      Atom(name: 'AppControllerBase._selectedLanguage', context: context);

  @override
  SupportedLanguages? get _selectedLanguage {
    _$_selectedLanguageAtom.reportRead();
    return super._selectedLanguage;
  }

  @override
  set _selectedLanguage(SupportedLanguages? value) {
    _$_selectedLanguageAtom.reportWrite(value, super._selectedLanguage, () {
      super._selectedLanguage = value;
    });
  }

  late final _$_selectedThemeAtom =
      Atom(name: 'AppControllerBase._selectedTheme', context: context);

  @override
  SupportedThemes? get _selectedTheme {
    _$_selectedThemeAtom.reportRead();
    return super._selectedTheme;
  }

  @override
  set _selectedTheme(SupportedThemes? value) {
    _$_selectedThemeAtom.reportWrite(value, super._selectedTheme, () {
      super._selectedTheme = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
