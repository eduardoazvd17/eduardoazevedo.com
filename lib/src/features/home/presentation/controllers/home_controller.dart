import 'package:eduardoazevedo/src/features/home/data/enums/home_page_tabs.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  HomePageTabs _currentPage = HomePageTabs.values.first;
  HomePageTabs get currentPage => _currentPage;
  void changePage(HomePageTabs newPage) => _currentPage = newPage;
}
