import 'package:admin_fujika_ecommerce/controllers/items/view.dart';
import 'package:admin_fujika_ecommerce/core/class/statusrequest.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:admin_fujika_ecommerce/core/functions/upload.dart';
import 'package:admin_fujika_ecommerce/data/datasource/remote/items.dart';
import 'package:admin_fujika_ecommerce/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'dart:async';

class ItemsEditController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropdownlist = [];

  List<ItemsModel> data = [];
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController descar;
  late TextEditingController desc;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController count;
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  ItemsModel? itemsModel;
  changestatusactive(val) {
    active = val;
    update();
  }

  TextEditingController? catid;
  TextEditingController? catname;

  StatusRequest? statusrequest = StatusRequest.none;
  File? file;
  String? active;
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

  editData() async {
    if (formstate.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.itemsId,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid!.text,
        "active": active,
        "imageold": itemsModel!.itemsImage!,
        "datenow": DateTime.now().toString()
      };
      var response = await itemsData.edit(data, file);
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

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
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
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    price.text = itemsModel!.itemsPrice!;
    discount.text = itemsModel!.itemsDiscount!;
    count.text = itemsModel!.itemsCount!;
    catid!.text = itemsModel!.categoriesId!;
    catname!.text = itemsModel!.categoriesName!;
    active = itemsModel!.itemsActive;
    super.onInit();
  }
}
