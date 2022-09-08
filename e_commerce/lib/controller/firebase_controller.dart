import 'package:e_commerce/screens/Authentication_Files/login_screen.dart';
import 'package:e_commerce/screens/navigationPage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name, String email, String password) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("Users");
    Map<String, String> userdata = {
      "User Name": name,
      "User Email": email,
      "User Password": password,
    };
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference.add(userdata).then((value) {
        Get.offAll(LoginScreen());
        Get.snackbar('Successfully Created', 'Now please login');
      });
    }).catchError(
      (onError) => Get.snackbar(
          'Exception on creating account', onError.message,
          snackStyle: SnackStyle.GROUNDED, snackPosition: SnackPosition.BOTTOM),
    );
  }

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(NavigationPage()))
        .catchError((onError) => Get.snackbar(
            'Exception on sign in account', onError.message,
            snackPosition: SnackPosition.BOTTOM));
  }

  void signout() async {
    await _auth.signOut().then((value) => Get.offAll(LoginScreen()));
  }

  void google_signIn() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

    final User user = (await _auth
            .signInWithCredential(credential)
            .then((value) => Get.offAll(NavigationPage())))
        ?.catchError((onError) => Get.snackbar(
            'Exception on sign in account with Google', onError.message,
            snackPosition: SnackPosition.BOTTOM)) as User;
  }

  Future<void> google_signOut() async {
    await googleSignIn.signOut();
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(LoginScreen());
      Get.snackbar(
          'Reset Password link has been sentin your email', 'Successful');
    }).catchError((onError) => Get.snackbar('Invalid Email', onError.message));
  }
}
