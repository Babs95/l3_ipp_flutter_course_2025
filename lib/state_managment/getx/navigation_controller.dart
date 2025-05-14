import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs; //obs pour la rendre observable dynamique

  void changePage(int index) {
    selectedIndex.value = index;
  }
}