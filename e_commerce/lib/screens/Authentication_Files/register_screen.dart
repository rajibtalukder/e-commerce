import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/firebase_controller.dart';

class RegisterScreen extends GetWidget<FirebaseController> {
  //const RegisterScreen({Key? key}) : super(key: key);

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          decoration:const BoxDecoration(
            image: DecorationImage(
              //alignment: Alignment.topRight,
              image: AssetImage("asset/images/bgImage4.jpg"),
              opacity: 1.6,
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  'Sign Up,',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                const Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height / 30,
                ),
                TextField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                  controller: name,
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  height: height / 30,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height / 50,
                ),
                TextField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                  controller: email,
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  height: height / 30,
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height / 40,
                ),
                TextField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                  controller: password,
                  obscureText: true,
                  style:const TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: TextButton(
                    onPressed: _signSubmit,
                    child: const Text(
                      'Sign Up',
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

  void _signSubmit() {
    controller.createUser(name.text, email.text, password.text);
  }
}
