import 'package:get/get.dart';

class ProfilePicController extends GetxController{
  var isProPicPathSet = false.obs;
  var proPicPath = "".obs;

  void setProImagePath(String path){
    proPicPath.value= path;
    isProPicPathSet.value=true;
  }
}