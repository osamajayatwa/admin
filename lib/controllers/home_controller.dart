import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeControllerImp extends GetxController {
  MyServices myServices = Get.find();
  logout() {
    String userid = myServices.sharedPreferences.getString("id").toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
