// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$scrollPositionAtom =
      Atom(name: 'HomeControllerBase.scrollPosition', context: context);

  @override
  double get scrollPosition {
    _$scrollPositionAtom.reportRead();
    return super.scrollPosition;
  }

  @override
  set scrollPosition(double value) {
    _$scrollPositionAtom.reportWrite(value, super.scrollPosition, () {
      super.scrollPosition = value;
    });
  }

  late final _$_currentPageAtom =
      Atom(name: 'HomeControllerBase._currentPage', context: context);

  @override
  HomePageTabs get _currentPage {
    _$_currentPageAtom.reportRead();
    return super._currentPage;
  }

  @override
  set _currentPage(HomePageTabs value) {
    _$_currentPageAtom.reportWrite(value, super._currentPage, () {
      super._currentPage = value;
    });
  }

  @override
  String toString() {
    return '''
scrollPosition: ${scrollPosition}
    ''';
  }
}
