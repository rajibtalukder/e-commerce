import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/product_model_topselling.dart';
import 'package:e_commerce/screens/Home_Files/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModelTopSelling> get productTopSellingModel =>
      _productTopSellingModel;
  final List<ProductModelTopSelling> _productTopSellingModel = [];

  HomeController() {
    getCategory();
    getTopSelling();
  }

  void getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));
        _loading.value = false;

        //print(_categoryModel.length);
      }
      update();
    });
  }

  void getTopSelling() async {
    _loading.value = true;
    HomeService().getTopSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productTopSellingModel
            .add(ProductModelTopSelling.fromJson(value[i].data() as Map));
        _loading.value = false;
        //print(_productTopSellingModel.length);
      }
      update();
      //print(value.docs[0].data());
    });
  }
}
