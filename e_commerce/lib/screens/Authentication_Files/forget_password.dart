import 'package:e_commerce/controller/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends GetWidget<FirebaseController> {
  //const ForgetPassword({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Media  Query...
    //maintaining screen size.
    //when we use MediaQuery ,it should divide by particular number.
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              //alignment: Alignment.bottomCenter,
              image: AssetImage("asset/images/bgImage4.jpg"),
              opacity: 1.6,
              fit: BoxFit.cover,
            ),
          ),
          height: height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                SizedBox(height: height / 20),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),

                // const Text(
                //   'Email',
                //   style: TextStyle(
                //       color: Colors.grey,
                //       fontSize: 18.0,
                //       fontWeight: FontWeight.w500),
                // ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(fontSize: 20.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                  controller: email,
                  style: const TextStyle(fontSize: 25.0),
                ),

                SizedBox(
                  height: height / 40,
                ),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child:  TextButton(
                    onPressed: (){
                      controller.resetPassword(email.text);
                    },
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
