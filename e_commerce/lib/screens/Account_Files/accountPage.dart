import 'dart:io';
import 'package:e_commerce/controller/firebase_controller.dart';
import 'package:e_commerce/controller/profilepic_controller.dart';
import 'package:e_commerce/screens/Account_Files/card_Page.dart';
import 'package:e_commerce/screens/Account_Files/notifications_Page.dart';
import 'package:e_commerce/screens/Account_Files/order_History_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountPage extends GetWidget<FirebaseController> {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  //RxString _imagepath=''.obs ;
  //final data = GetStorage();
  AccountPage({Key? key}) : super(key: key);

  ProfilePicController profilePicController = Get.put(ProfilePicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.black12,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60))),
                    child: Obx(
                      () => CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            profilePicController.isProPicPathSet.value == true
                                ? FileImage(
                                    File(profilePicController.proPicPath.value),
                                  ) as ImageProvider
                                : const AssetImage('asset/images/rajib.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: GestureDetector(
                        onTap: _imageUpload,
                        child: const CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 20,
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ),
                    bottom: 4,
                    right: -10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Hey',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Email : ${controller.user}',
              style: const TextStyle(color: Colors.black87, fontSize: 20.0),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ListTile(
                onTap: () {
                  Get.to(const NotificationsPage(),
                      transition: Transition.rightToLeft);
                },
                leading: const Icon(
                  Icons.notifications,
                  color: Colors.teal,
                ),
                title: const Text('Notifications',
                    style: TextStyle(fontSize: 20.0)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ListTile(
                onTap: () {
                  Get.to(const CardPage(), transition: Transition.rightToLeft);
                },
                leading: const Icon(
                  Icons.credit_card,
                  color: Colors.teal,
                ),
                title: const Text('Card', style: TextStyle(fontSize: 20.0)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ListTile(
                onTap: () {
                  Get.to(const OrderHistory(),
                      transition: Transition.rightToLeft);
                },
                leading: const Icon(
                  Icons.history,
                  color: Colors.teal,
                ),
                title: const Text('Order History',
                    style: TextStyle(fontSize: 20.0)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ListTile(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      child: Wrap(
                        children: [
                          ListTile(
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                              Get.back();
                            },
                            title: const Text('Dart Mode',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            leading: const Icon(
                              Icons.dark_mode,
                              color: Colors.teal,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                              Get.back();
                            },
                            title: const Text('Light Mode',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            leading: const Icon(Icons.light_mode,
                                color: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                leading: const Icon(
                  Icons.dark_mode_outlined,
                  color: Colors.teal,
                ),
                title: const Text('Theme', style: TextStyle(fontSize: 20.0)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ListTile(
                onTap: () {
                  controller.signout();
                  controller.google_signOut();
                },
                leading: const Icon(
                  Icons.logout,
                  color: Colors.teal,
                ),
                title: const Text('Log Out', style: TextStyle(fontSize: 20.0)),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //method for image upload process
  //show dialog box UI design
  void _imageUpload() {
    Get.defaultDialog(
        titlePadding: const EdgeInsets.all(12.0),
        title: 'Choose profile photo',
        titleStyle: const TextStyle(fontSize: 25.0),
        middleText: 'upload your photo',
        middleTextStyle: const TextStyle(color: Colors.teal),
        actions: [
          IconButton(
            onPressed: () {
              takePhoto(ImageSource.gallery);
            },
            padding: const EdgeInsets.only(bottom: 40),
            icon: const Icon(Icons.photo, size: 50.0),
          ),
          const SizedBox(
            width: 40,
          ),
          IconButton(
              onPressed: () {
                takePhoto(ImageSource.camera);
                //saveImage(pickedFile);
              },
              padding: const EdgeInsets.only(bottom: 40),
              icon: const Icon(
                Icons.camera_alt,
                size: 50.0,
              )),
        ]);
  }

  //Take photo function is here......
  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    profilePicController.setProImagePath(pickedFile!.path);
    Get.back();
  }

// Future<void> saveImage(imgPath) async {
//   SharedPreferences saveimage= await SharedPreferences.getInstance();
//   saveimage.setString('imagepath', imgPath);
// }
//
// Future<void> loadImage(imgPath) async {
//   SharedPreferences saveimage= await SharedPreferences.getInstance();
//   saveimage.get('imagepath');
// }

}
