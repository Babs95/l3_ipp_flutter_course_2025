import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l3_ipp_app/state_managment/getx/navigation_controller.dart';
import 'package:l3_ipp_app/views/auth/login_screen.dart';

import '../views/home.dart';
import '../views/settings_screen.dart';

class NavigationWrapper extends StatelessWidget {
  NavigationWrapper({super.key});
  //Initialisation du controller GetX
  final NavigationController controller = Get.put(NavigationController());

  final List<Widget> pages = [
    const Home(),
    const LoginScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        onTap: (index) {
          controller.changePage(index);
        },
        items: [
          BottomNavigationBarItem(label: 'Accueil', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Profil', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Paramètres', icon: Icon(Icons.settings))
        ],
      )),
    );
  }

}