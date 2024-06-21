import 'package:admin_fujika_ecommerce/core/class/crud.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';

class VerifyCodeForgetPassData {
  Crud crud;
  VerifyCodeForgetPassData(this.crud);
  forgetdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.forgetverifycode, {
      "email ": email,
      "verifycode ": verifycode,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
