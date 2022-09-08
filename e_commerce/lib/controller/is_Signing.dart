import 'package:e_commerce/controller/firebase_controller.dart';
import 'package:e_commerce/screens/Authentication_Files/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../screens/navigationPage.dart';

class IsSigning extends GetWidget<FirebaseController> {
  const IsSigning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseController>().user != null
          ? NavigationPage()
          : LoginScreen();
    });
  }
}
