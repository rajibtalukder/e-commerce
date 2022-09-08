import 'package:e_commerce/controller/firebase_controller.dart';
import 'package:e_commerce/screens/Authentication_Files/forget_password.dart';
import 'package:e_commerce/screens/Authentication_Files/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<FirebaseController> {
  //const LoginScreen({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
              //alignment:Alignment.topCenter,
              image: AssetImage("asset/images/bgImage4.jpg"),
              opacity: 1.6,
              fit: BoxFit.cover,
            ),
          ),
          height: height,
          child:  Padding(
              padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome,',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign in to continue',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterScreen(),
                              transition: Transition.rightToLeft);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.teal),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height / 10,
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
                    style:const TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    height: height / 40,
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
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ForgetPassword(),
                            transition: Transition.rightToLeft);
                      },
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                    ),
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
                    child: TextButton(
                      onPressed: () {
                        controller.login(email.text, password.text);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '-OR-',
                      style:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/images/google-logo.png',
                          width: 30,
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            controller.google_signIn();
                          },
                          child: const Text(
                            'Sign in with Google',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black87),
                          ),
                        ),
                      ],
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
