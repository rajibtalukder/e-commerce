import 'package:e_commerce/controller/view_model_cart_controller.dart';
import 'package:e_commerce/screens/Cart_Files/checkOut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: GetBuilder<ViewModelCart>(
            init: Get.put(ViewModelCart()),
            //init: Get.find(),
            builder: (controller) => controller.cartProductModel.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("asset/images/nocart.png"),
                        const Text("No Cart Added",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  )
                : Container(
                    child: ListView.separated(
                      itemCount: controller.cartProductModel.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 140,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 140,
                                width: 140,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(15),
                                // ),
                                child: Image.network(
                                  controller.cartProductModel[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Spacer(),
                              Column(
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.cartProductModel[index].name,
                                    style: const TextStyle(fontSize: 22.0),
                                  ),
                                  Text(
                                    '\$ ${controller.cartProductModel[index].price.toString()}',
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            controller.increaseQuantity(index);
                                          },
                                          icon: const Icon(Icons.add)),
                                      const SizedBox(width: 10),
                                      Text(
                                        controller
                                            .cartProductModel[index].quantity
                                            .toString(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                          onPressed: () {
                                            controller.decreaseQuantity(index);
                                          },
                                          icon: const Icon(
                                              Icons.horizontal_rule)),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Spacer(),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  GetBuilder<ViewModelCart>(
                    init: Get.find(),
                    builder: (controller) => Text(
                      '\$ ${controller.totalPrice}',
                      style:
                          const TextStyle(fontSize: 22.0, color: Colors.teal),
                    ),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.teal),
                onPressed: () {
                  Get.to(CheckOut());
                },
                child: const Text(
                  'CHECKOUT',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
