import 'package:admin_fujika_ecommerce/controllers/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get/get.dart';

requestPermissionNotification() async {}

fcmconfig() {
  print("hai =======================================================");
  FirebaseMessaging.onMessage.listen((message) {
    print("================== Notification =================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

class FlutterRingtonePlayer {
  static void playNotification() {}
}

refreshPageNotification(data) {
  print("============================= page id ");
  print(data['pageid']);
  print("============================= page name ");
  print(data['pagename']);
  print("================== Current Route");
  print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingController controller = Get.find();
    controller.refrehOrder();
  }
}


// Firebase + stream 
// Socket io 
// Notification refresh 