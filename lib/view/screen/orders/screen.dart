import 'package:admin_fujika_ecommerce/controllers/orders/screen_controller.dart';
import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:admin_fujika_ecommerce/view/widget/orders/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColor.secondColor,
              ),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: Container(
                child: controller.listPage.elementAt(controller.currentpage),
              ),
            ));
  }
}
