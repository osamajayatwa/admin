import 'package:admin_fujika_ecommerce/controllers/auth/logincontroller.dart';
import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:admin_fujika_ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text(
            '32'.tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColor.grey,
                ),
          )),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
            Text(
              "28".tr,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomBottunAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToSignUp();
                },
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}