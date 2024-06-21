import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/core/services/services.dart';
import 'package:admin_fujika_ecommerce/data/model/testmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/auth/logindata.dart';
import 'package:get/get.dart';

abstract class UsersController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class UsersControllerImp extends UsersController {
  LoginData loginData = LoginData(Get.find());
  late TestModel emailmodel;
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
          //if (response['data']['admin_approve'] == "1") {
          myServices.sharedPreferences
              .setString("id", response['data']['admins_id'].toString());

          myServices.sharedPreferences.getString("id").toString();
          myServices.sharedPreferences
              .setString("username", response['data']['admins_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['admins_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['admins_phone'].toString());

          Get.offNamed(AppRoute.homepage);
          // } else {
          // Get.toNamed(AppRoute.verfiyCodeSignUp,
          //  arguments: {"email": email.text});
          //  }
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
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
    });
    email = Get.arguments['testmodel'];
    email = TextEditingController();
    password = TextEditingController();
    email.text = emailmodel.usersEmail!;
    password.text = emailmodel.usersPassword!;
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
