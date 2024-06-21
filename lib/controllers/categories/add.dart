import 'package:admin_fujika_ecommerce/controllers/categories/view.dart';
import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/core/functions/upload.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_fujika_ecommerce/data/model/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'dart:async';

class CategoriesAddController extends GetxController {
  CategoriesData catdata = CategoriesData(Get.find());
  List<CategoriesModel> data = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest? statusrequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController namear;
  File? file;

  Future<void> chooseImage() async {
    File? selectedFile = await fileUploadGallery();
    if (selectedFile != null) {
      file = selectedFile;
      update();
    }
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Choose Image");
      statusrequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text, "namear": namear.text};
      var response = await catdata.add(data, file!);
      print("=============================== Controller $response ");
      statusrequest = handilingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoute.categoryview);
          CategoriesController c = Get.find();
          c.getData();
        } else {
          statusrequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
