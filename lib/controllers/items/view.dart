import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/items.dart';
import 'package:admin_fujika_ecommerce/data/model/itemsmodel.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  ItemsData itemsdata = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusrequest;

  getData() async {
    data.clear();
    statusrequest = StatusRequest.loading;

    var response = await itemsdata.get();

    print("=============================== Controller $response ");

    statusrequest = handilingData(response);

    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String id, String imagename) {
    itemsdata.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  edit(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsedit, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  onback() {
    Get.offAllNamed(AppLink.homepage);
    return Future.value(false);
  }
}
