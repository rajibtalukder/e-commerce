import 'package:e_commerce/controller/is_Signing.dart';
import 'package:e_commerce/controller/view_model_cart_controller.dart';
import 'package:e_commerce/widgets/instanceBinding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  // ignore: non_constant_identifier_names
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ViewModelCart());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      debugShowCheckedModeBanner: false,
      home:const IsSigning(),
    );
  }
}
