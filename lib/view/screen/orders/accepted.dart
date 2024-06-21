import 'package:admin_fujika_ecommerce/controllers/orders/accepted.dart';
import 'package:admin_fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:admin_fujika_ecommerce/view/widget/orders/orderlistcardaccepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersAcceptedController>(
              builder: ((controller) => HandilingDataView(
                  statusrequest: controller.statusrequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) => CardOrdersListAccepted(
                        listdata: controller.data[index])),
                  )))),
        ));
  }
}
