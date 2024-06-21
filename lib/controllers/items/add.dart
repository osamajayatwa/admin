import 'package:admin_fujika_ecommerce/controllers/items/view.dart';
import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/core/functions/upload.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/items.dart';
import 'package:admin_fujika_ecommerce/data/model/categorymodel.dart';
import 'package:admin_fujika_ecommerce/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'dart:async';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropdownlist = [];

  List<ItemsModel> data = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController descar;
  late TextEditingController desc;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController count;
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

  TextEditingController? catid;
  TextEditingController? catname;

  StatusRequest? statusrequest = StatusRequest.none;
  File? file;

  Future<void> showOptionImage() async {
    showbottommenu(chooseImagecamera, chooseImageGallery);
  }

  Future<void> chooseImagecamera() async {
    file = await imageUpLoadCamera();
    update();
  }

  Future<void> chooseImageGallery() async {
    File? selectedFile = await fileUploadGalleryitem();
    if (selectedFile != null) {
      file = selectedFile;
      update();
    }
  }

/*  Future<void> chooseImage() async {
    File? selectedFile = await fileUploadGallery();
    if (selectedFile != null) {
      file = selectedFile;
      update();
    }
  }*/

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Choose Image");

      statusrequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid!.text,
        "datenow": DateTime.now().toString()
      };
      var response = await itemsData.add(data, file!);
      print("=============================== Controller $response ");
      statusrequest = handilingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoute.itemsview);
          ItemsController c = Get.find();
          c.getData();
        } else {
          statusrequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  getCat() async {
    List<CategoriesModel> data = [];
    CategoriesData catdata = CategoriesData(Get.find());

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
        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      } else {
        statusrequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getCat();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    dropdownid = TextEditingController();
    dropdownname = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();

    super.onInit();
  }
}
