import 'package:admin_fujika_ecommerce/controllers/orders/archive_controller.dart';
import 'package:admin_fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:admin_fujika_ecommerce/view/widget/orders/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: ((controller) => HandilingDataView(
                  statusrequest: controller.statusrequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) => CardOrdersListArchive(
                        listdata: controller.data[index])),
                  )))),
        ));
  }
}
