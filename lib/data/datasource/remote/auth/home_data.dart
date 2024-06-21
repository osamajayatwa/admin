import 'package:admin_fujika_ecommerce/core/class/crud.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
