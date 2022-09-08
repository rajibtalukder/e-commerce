import 'package:e_commerce/controller/firebase_controller.dart';
import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/controller/view_model_cart_controller.dart';
import 'package:get/get.dart';

class InstanceBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FirebaseController>(() => FirebaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ViewModelCart>(() => ViewModelCart());
  }

}