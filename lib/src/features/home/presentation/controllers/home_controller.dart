import 'package:eduardoazevedo/src/features/home/data/enums/home_page_tabs.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  double scrollPosition = 0.0;

  AnimationController? _pageAnimationController;
  set pageAnimationController(AnimationController animationController) {
    _pageAnimationController = animationController;
  }

  @observable
  HomePageTabs _currentPage = HomePageTabs.values.first;
  HomePageTabs get currentPage => _currentPage;
  Future<void> changePage(HomePageTabs newPage) async {
    if (_currentPage != newPage) {
      await _pageAnimationController?.reverse();
      _currentPage = newPage;
      await _pageAnimationController?.forward(from: 0);
    }
  }
}
