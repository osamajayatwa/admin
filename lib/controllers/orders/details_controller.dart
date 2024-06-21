import 'dart:async';
import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/orders/details_data.dart';
import 'package:admin_fujika_ecommerce/data/model/cartmodel.dart';
import 'package:admin_fujika_ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusrequest = StatusRequest.none;

  late OrdersModel ordersModel;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? cameraPosition;

  getData() async {
    statusrequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    print("=============================== Controller $response ");
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
      intialData();
    getData();
    super.onInit();
  }

  intialData() {
    completercontroller = Completer<GoogleMapController>();
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));
    }
  }
}
