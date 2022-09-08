import 'package:e_commerce/models/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../databaseCart/cart_database_helper.dart';

class ViewModelCart extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  var dbHelper = CartDatabaseHelper.db;

  ViewModelCart() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    //print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);

    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);

    update();
    Get.snackbar('Successfully done', 'Your product added on cart',
        snackPosition: SnackPosition.BOTTOM);
  }

  deleteData(table, itemId) async {
  final db = await dbHelper.database;
  return await db?.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      //print(_totalPrice);
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }
}
