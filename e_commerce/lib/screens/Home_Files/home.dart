import 'package:carousel_pro/carousel_pro.dart';
import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/screens/Home_Files/details_product.dart';
import 'package:e_commerce/screens/Home_Files/see_All_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageSlider = SizedBox(
      height: 200,
      width: double.infinity,
      child: Carousel(
        indicatorBgPadding: 10.0,
        //dotSpacing: 15,
        //dotColor: Colors.teal,
        boxFit: BoxFit.cover,
        images: const [
          AssetImage('asset/images/slider1.jpg'),
          AssetImage('asset/images/slider2.jpg'),
          AssetImage('asset/images/slider3.jpg'),
          AssetImage('asset/images/slider4.png'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: const Duration(milliseconds: 1000),
      ),
    );

    //HomeController controller = Get.put(HomeController());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(
      init: Get.put(HomeController()),
      builder: (controller) =>
          // controller.loading.value
          //     ? const Center(
          //         child: SpinKitWave(
          //           color: Colors.teal,
          //           size: 50.0,
          //         ),
          //       )
          //     :
          Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(25.0),
              //   color: Colors.black12,
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Search',
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal)),
                  TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontSize: 22.0,
                      letterSpacing: 1,
                    ),
                    decoration: InputDecoration(
                      hintText: 'What are you looking for?',
                      hintStyle: TextStyle(color: Colors.black38, fontSize: 20),
                      iconColor: Colors.black,
                      //border: InputBorder.none,
                      suffixIcon: Icon(Icons.search, color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            imageSlider,
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                //mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  _customCategories(),
                  SizedBox(
                    height: height / 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Selling',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.teal,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SeeAllPage(),
                              transition: Transition.rightToLeft);
                        },
                        child: const Text(
                          'See all',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  _customTopselling(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  //custom widgets.....................................................
  //custom widgets.....................................................

  Widget _customCategories() {
    return GetBuilder<HomeController>(
      builder: (controller) => controller.loading.value
          ? const CircularProgressIndicator()
          : SizedBox(
        height: 100.0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(children: [
              SizedBox(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10.0),
                //   color: Colors.black12,
                // ),
                height: 50,
                width: 50,
                //color: Colors.grey,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    controller.categoryModel[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(controller.categoryModel[index].name,
                  style: const TextStyle(fontSize: 18)),
            ]);
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 25,
          ),
        ),
      ),
    );
  }

  Widget _customTopselling() {
    return GetBuilder<HomeController>(
      builder: (controller) => controller.loading.value
          ? const CircularProgressIndicator()
          : SizedBox(
              height: 270.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 170,
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
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
              ),
            ),
    );
  }
}
