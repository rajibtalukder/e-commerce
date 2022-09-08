import 'package:e_commerce/screens/Cart_Files/complete_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/checkOut_Controller.dart';
import '../../controller/view_model_cart_controller.dart';

class CheckOut extends StatelessWidget {
  // var productName, productImage, totalPrice;
  // CheckOut({this.productName, this.productImage,this.totalPrice});
  // CheckOut({Key? key}) : super(key: key);
  CheckOutController controller = Get.put(CheckOutController());
  final name = TextEditingController();

  final contact = TextEditingController();

  final street = TextEditingController();

  final city = TextEditingController();

  final state = TextEditingController();

  final country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(
          primarySwatch: Colors.teal,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Obx(
            () => Stepper(
              type: StepperType.vertical,
              steps: buildSteps(),
              currentStep: controller.currentStep.value,
              onStepContinue: () {
                if (controller.currentStep.value == buildSteps().length - 1) {
                  print('no data');
                  Get.defaultDialog(

                    content: const Icon(Icons.cloud_done_sharp,
                        size: 120, color: Colors.teal),
                    title: 'Completed',
                    titleStyle: const TextStyle(fontSize: 25),
                    actions: [
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.black12),
                          onPressed: () {
                            Get.back();
                          },
                          child:const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Text("OK",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ))
                    ],
                  );
                } else {
                  controller.currentStep.value++;
                }
              },
              onStepCancel: () {
                controller.currentStep.value == 0
                    ? null
                    : controller.currentStep.value--;
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep =
                    controller.currentStep.value == buildSteps().length - 1;
                return Row(
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          backgroundColor: Colors.teal),
                      onPressed: details.onStepContinue,
                      child: Text(isLastStep ? 'SUBMIT' : 'NEXT',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (controller.currentStep != 0)
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            backgroundColor: Colors.black12),
                        onPressed: details.onStepCancel,
                        child:
                            const Text('BACK', style: TextStyle(fontSize: 18)),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Step> buildSteps() {
    return [
      // this is the step 1 starts
      // here you can see the design of personal information part,
      // we're trying to maintain the code as you can understand while you
      // see this page...
      Step(
        title: const Text("Personal"),
        content: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Your name',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                onChanged: (value) {
                  var _name = name.value;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                style: const TextStyle(fontSize: 22.0),
                controller: name,
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact no',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                onChanged: (value) {
                  var _conNo = contact.value;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                style: const TextStyle(fontSize: 22.0),
                controller: contact,
              ),
            ])),
        isActive: controller.currentStep.value >= 0,
        state: controller.currentStep.value > 0
            ? StepState.complete
            : StepState.indexed,
      ),
      // this is the step 2 starts
      // here you can see the design of Address information part,
      // we're trying to maintain the code as you can understand while you
      // see this page...
      // lets start
      // ....
      Step(
        title: const Text("Address"),
        content: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Street',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                onChanged: (value) {
                  var _street = street.value;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                style: const TextStyle(fontSize: 22.0),
                controller: street,
              ),
              const SizedBox(height: 20),
              const Text(
                'City',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                onChanged: (value) {
                  var _city = city.value;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                style: const TextStyle(fontSize: 22.0),
                controller: city,
              ),
              const SizedBox(height: 20),
              const Text(
                'State',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                onChanged: (value) {
                  var _state = state.value;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                style: const TextStyle(fontSize: 22.0),
                controller: state,
              ),
              const SizedBox(height: 20),
              const Text(
                'Country',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                onChanged: (value) {
                  var _country = country.value;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                style: const TextStyle(fontSize: 22.0),
                controller: country,
              ),
            ])),
        isActive: controller.currentStep.value >= 1,
        state: controller.currentStep.value > 1
            ? StepState.complete
            : StepState.indexed,
      ),
      //this is the step 3 starts
      // here you can see the design of summary information part,
      // we're trying to maintain the code as you can understand while you
      // see this page...
      Step(
        title: const Text("Summary"),
        content: Column(
          // crossAxisAlignment:CrossAxisAlignment.start,
          // mainAxisAlignment:MainAxisAlignment.start,
          children: [
            //here is the products from cart
            // there are also available the price of each products
            //even the total price also...

            GetBuilder<ViewModelCart>(
                builder: (controller) => Column(
                      children: [
                        Container(
                          height: 230,
                          //color: Colors.red,
                          padding: EdgeInsets.all(10),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    child: Image.network(
                                        controller
                                            .cartProductModel[index].image,
                                        fit: BoxFit.cover),
                                  ),
                                  Text(
                                    controller.cartProductModel[index].name,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                      "\$ ${controller.cartProductModel[index].price}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.teal)),
                                ],
                              ),
                            ),
                            itemCount: controller.cartProductModel.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 15);
                            },
                          ),
                        ),
                        Text(
                          'Total Price:  \$ ${controller.totalPrice}',
                          style: const TextStyle(
                              fontSize: 22.0, color: Colors.teal),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),

            //so this is the end of cart products
            //now start the personal information
            //and location also...

            const SizedBox(height: 20),
            Text("Name:   ${name.text}", style: const TextStyle(fontSize: 20)),
            Text("Contact No:   ${contact.text}",
                style: const TextStyle(fontSize: 20)),
            Text("Street:   ${street.text}",
                style: const TextStyle(fontSize: 20)),
            Text("City:   ${city.text}", style: const TextStyle(fontSize: 20)),
            Text("State:   ${state.text}",
                style: const TextStyle(fontSize: 20)),
            Text("Country:   ${country.text}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
          ],
        ),
        isActive: controller.currentStep.value >= 2,
      ),
    ];
  }

  completeFunc() {
    Get.to(const CompleteScreen());
  }
}
