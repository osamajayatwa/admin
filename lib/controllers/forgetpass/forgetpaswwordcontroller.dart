import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/forgetpass/checkemail.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusrequest = StatusRequest.none;

  late TextEditingController email;

  List data = [];

  @override
  checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.loginpostdata(
        email.text,
      );

      statusrequest = handilingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Email Not Found");
          statusrequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
