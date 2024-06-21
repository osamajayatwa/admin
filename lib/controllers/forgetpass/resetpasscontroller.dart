import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/forgetpass/resetpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpass();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;
  StatusRequest statusrequest = StatusRequest.none;
  ResetData resetData = ResetData(Get.find());
  String? email;

  @override
  resetpass() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "password not match");
    }

    if (formstate.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await resetData.resetdata(email!, password.text);
      statusrequest = handilingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successResetpassword);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Try Again");
          statusrequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
