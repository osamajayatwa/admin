import 'package:admin_fujika_ecommerce/core/class/crud.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.acceptedorders, {});
    return response.fold((l) => l, (r) => r);
  }

  done(String ordersid, String usersid, String orderstype) async {
    var response = await crud.postData(AppLink.ordersprepare,
        {"ordersid": ordersid, "usersid": usersid, "ordertype": orderstype});
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
