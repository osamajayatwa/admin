import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/view/screen/orders/archive.dart';
import 'package:admin_fujika_ecommerce/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int currentpage);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;
  late StatusRequest statusRequest = StatusRequest.none;
  List<Widget> listPage = [
    const OrdersPending(),
    // const OrdersAccepted(),
    const OrdersArchiveView()
  ];

  List bottomappbar = [
    {"title": "order", "icon": Icons.home},
    //  {"title": "Accepted", "icon": Icons.shopping_cart_checkout_sharp},
    {"title": "Archive", "icon": Icons.archive_outlined},
  ];

  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
