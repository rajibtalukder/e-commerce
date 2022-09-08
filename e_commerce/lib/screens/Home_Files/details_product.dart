import 'package:e_commerce/models/cart_product_model.dart';
import 'package:e_commerce/controller/view_model_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model_topselling.dart';

class DetailsProduct extends StatelessWidget {
  //const DetailsProduct({Key? key}) : super(key: key);
  late ProductModelTopSelling model;

  DetailsProduct({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //ViewModelCart controller = Get.put(ViewModelCart());
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 90,
        width: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          focusColor: Colors.transparent,
          elevation: 0.0,
          onPressed: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 320,
                    width: width,
                    child: Image.network(
                      model.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: const TextStyle(
                              fontSize: 33, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: height / 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Size: ' + model.sized,
                                style: const TextStyle(fontSize: 20)),
                            Text(model.color,
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                        SizedBox(height: height / 15),
                        const Text('Details',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w500)),
                        SizedBox(height: height / 50),
                        Text(model.description,
                            style: const TextStyle(
                                fontSize: 20, letterSpacing: 2)),
                      ],
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Text('Price',
                  //             style: TextStyle(
                  //                 fontSize: 25)),
                  //         Text(model.price,style: TextStyle(
                  //             fontSize: 22)),
                  //       ],
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                  offset: Offset(5.0, 0.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$ ${model.price}',
                        style: const TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                  GetBuilder<ViewModelCart>(
                    init: ViewModelCart(),
                    //init: Get.find(),
                    builder: (controller) => TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        controller.addProduct(CartProductModel(
                          name: model.name,
                          image: model.image,
                          price: model.price,
                          quantity: 1,
                          productId:model.productId,
                        ));
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                        child: Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
