import 'package:admin_fujika_ecommerce/core/class/crud.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.ordersview, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String userid, String ordersid) async {
    var response = await crud.postData(AppLink.ordersapprove, {
      "usersid": userid,
      "ordersid": ordersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
