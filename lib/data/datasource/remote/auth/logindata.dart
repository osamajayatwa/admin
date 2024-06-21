import 'package:admin_fujika_ecommerce/core/class/crud.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  loginpostdata(String email, String password) async {
    var response = await crud.postData(AppLink.logindata, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
