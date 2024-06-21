import 'dart:io';
import 'package:admin_fujika_ecommerce/core/class/crud.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  get() async {
    var response = await crud.postData(AppLink.categoryview, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.categoryadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.categorydelete, data);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.categoryedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.categoryedit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
