import 'package:e_commerce/controller/navigation_controller.dart';
import 'package:e_commerce/screens/Account_Files/accountPage.dart';
import 'package:e_commerce/screens/Cart_Files/cartPage.dart';
import 'package:e_commerce/screens/Home_Files/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({Key? key}) : super(key: key);
  NavigationController navigationController = Get.put(NavigationController());
  final pages = [
    HomePage(),
    CartPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: Get.put(HomeController()),
        builder: (controller) => controller.loading.value
            ? const Center(
                child: SpinKitWave(
                  color: Colors.teal,
                  size: 50.0,
                ),
              )
            : Scaffold(
                body: Obx(
                  () => IndexedStack(
                    index: navigationController.selectedIndex.value,
                    children: pages,
                  ),
                ),
                bottomNavigationBar: Obx(
                  () => BottomNavigationBar(
                    selectedLabelStyle: const TextStyle(fontSize: 20.0),
                    unselectedFontSize: 17.0,
                    selectedItemColor: Colors.teal,
                    currentIndex: navigationController.selectedIndex.value,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle_outlined),
                          label: 'Profile'),
                    ],
                    onTap: (index) {
                      navigationController.changeIndex(index);
                    },
                  ),
                ),
              ));
  }
}
