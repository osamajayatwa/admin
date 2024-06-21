import 'package:admin_fujika_ecommerce/core/class/crud.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String adminid) async {
    var response = await crud.postData(AppLink.notification, {"id": adminid});
    return response.fold((l) => l, (r) => r);
  }
}
