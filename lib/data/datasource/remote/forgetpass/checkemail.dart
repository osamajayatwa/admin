import 'package:admin_fujika_ecommerce/core/class/crud.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  loginpostdata(
    String email,
  ) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
