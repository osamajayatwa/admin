import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_fujika_ecommerce/data/model/categorymodel.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

import 'package:get/get.dart';

class CategoriesController extends GetxController {
  CategoriesData catdata = CategoriesData(Get.find());

  List<CategoriesModel> data = [];

  late StatusRequest statusrequest;

  getData() async {
    data.clear();
    statusrequest = StatusRequest.loading;

    var response = await catdata.get();

    print("=============================== Controller $response ");

    statusrequest = handilingData(response);

    if (StatusRequest.success == statusrequest) {
      // Start backend
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String id, String imagename) {
    catdata.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  edit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoute.categoryedit,
        arguments: {"categoriesModel": categoriesModel});
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
