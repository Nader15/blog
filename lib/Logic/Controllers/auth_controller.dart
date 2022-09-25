import 'package:blog/Routes/routes.dart';
import 'package:blog/Utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Models/user_model.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var isLoading = false.obs;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  User? get userProfile => auth.currentUser;

  @override
  onInit() {
    super.onInit();

    if (userProfile != null) {
      displayUserPhoto.value = userProfile!.photoURL??"https://th.bing.com/th/id/R.88f4f67fe36423a9f099e32757f61acc?rik=CLtRO2eGANx4Vw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_329115.png&ehk=mXoK%2be700RIpbejgADkfZYJSnzVqJhHHmQWdguPy40k%3d&risl=&pid=ImgRaw&r=0";
      displayUserName.value =  userProfile!.displayName?? "";
      displayUserEmail.value = userProfile!.email ?? "";
    }
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading(true);
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async{
       await userProfile!.updateDisplayName(name);
        userCreate(
          uId: value.user!.uid,
          name: name,
          email: email,
          image: value.user!.photoURL??"",
        );
      });
      update();
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }finally{
      isLoading(false);
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    isLoading(true);
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password);

      update();
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
        ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }finally{
      isLoading(false);
    }
  }

  var googleSignIn = GoogleSignIn();

  void googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl ?? "";
      displayUserEmail.value = googleUser.email;
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleUser.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(authCredential);

      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'ERROR!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(error.toString());
    }
  }



  void logOut() async{
    await auth.signOut();
    await googleSignIn.signOut();
    Get.offAllNamed(Routes.splashScreen);
  }

  void userCreate({
    required String uId,
    required String name,
    required String email,
    required String image,

  }) {
    UsersModel usersModel = UsersModel(
        uId: uId,
        name: name,
        email: email,
        image: '',
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(
      usersModel.toMap(),
    )
        .then((value) {
    }).catchError((error) {
      Get.snackbar(
        'FireStore!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

}
