
import 'package:e_commerce/screens/Home_Files/details_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();

            },
            icon:const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'All Products',
          style: TextStyle(color: Colors.black,fontSize: 22.0),
        ),centerTitle:true,
      ),
      body: _customTopsellingSeeAll(),
    );
  }

  Widget _customTopsellingSeeAll() {
    return GetBuilder<HomeController>(
      builder: (controller) =>controller.loading.value
          ? const Center(
        child: SpinKitWave(
          color: Colors.teal,
          size: 50.0,
        ),
      )
          : GridView.builder(
              padding:const EdgeInsets.only(top: 20),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //crossAxisSpacing: 3.0,
                //mainAxisSpacing: 3.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: controller.productTopSellingModel.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                        DetailsProduct(
                            model: controller.productTopSellingModel[index]),
                        transition: Transition.topLevel);
                  },
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        //padding: EdgeInsets.all(5.0),
                        // decoration:  BoxDecoration(
                        //   borderRadius: BorderRadius.all(Radius.circular(10)),
                        //   color: Colors.grey.shade300,
                        // ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          child: Image.network(
                            controller.productTopSellingModel[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        controller.productTopSellingModel[index].name,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$ ${controller.productTopSellingModel[index].price}',
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
