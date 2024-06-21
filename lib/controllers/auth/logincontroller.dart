import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/auth/logindata.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.loginpostdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handilingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if (response['data']['admins_approve'] == "1") {
            Get.offNamed(AppRoute.homepage);
          } else {
            Get.toNamed(AppRoute.verfiyCodelogin,
                arguments: {"email": email.text});
          }
          myServices.sharedPreferences
              .setString("id", response['data']['admins_id'].toString());

          String adminid = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("username", response['data']['admins_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['admins_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['admins_phone'].toString());
          FirebaseMessaging.instance.subscribeToTopic("admins");
          FirebaseMessaging.instance.subscribeToTopic("admins$adminid");
          myServices.sharedPreferences.setString("step", "2");
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoute.homepage);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
