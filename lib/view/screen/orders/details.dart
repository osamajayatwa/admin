import 'package:admin_fujika_ecommerce/controllers/orders/details_controller.dart';

import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<OrdersDetailsController>(
              builder: ((controller) => //HandilingDataView(
                  // statusrequest: controller.statusrequest,widget:
                  ListView(children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                const TableRow(children: [
                                  Text("Item",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold)),
                                  Text("QTY",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold)),
                                  Text("Price",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold)),
                                ]),
                                const TableRow(children: [
                                  Text("Macbook m1",
                                      textAlign: TextAlign.center),
                                  Text("2", textAlign: TextAlign.center),
                                  Text("1200", textAlign: TextAlign.center),
                                ]),
                                ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(children: [
                                          Text(
                                              "${controller.data[index].itemsName}",
                                              textAlign: TextAlign.center),
                                          Text(
                                              "${controller.data[index].countitems}",
                                              textAlign: TextAlign.center),
                                          Text(
                                              "${controller.data[index].itemsprice}",
                                              textAlign: TextAlign.center),
                                        ]))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                  "Total Price : ${controller.ordersModel.ordersTotalprice}\$",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (controller.ordersModel.ordersType == "1")
                      Card(
                        child: ListTile(
                          title: const Text("Shipping Address",
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                        ),
                      ),
                    if (controller.ordersModel.ordersType == "0")
                      Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 300,
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controller.completercontroller!
                                  .complete(controllermap);
                            },
                          ),
                        ),
                      ),
                  ])))),
      //),
    );
  }
}
