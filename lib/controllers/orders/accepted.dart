import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/core/services/services.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/orders/accepted_data.dart';
import 'package:admin_fujika_ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersAcceptedController extends GetxController {
  OrdersAcceptedData ordersPendingData = OrdersAcceptedData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusrequest;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.getData();
    print("=============================== Controller $response ");
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  done(
    String ordersid,
    String usersid,
    String orderstype,
  ) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.done(ordersid, usersid, orderstype);
    print("=============================== Controller $response ");
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  approveOrder(String userid, String ordersid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.approveOrder(
      userid,
      ordersid,
    );
    print("=============================== Controller $response ");
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
