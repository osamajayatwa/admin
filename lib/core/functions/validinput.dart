import 'package:get/get.dart';

validInput(
  String val,
  int min,
  int max,
  String type,
) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "01".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "02".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "03".tr;
    }
    if (val.isEmpty) {
      return " Can't Be Empty";
    }
  }
  if (val.length < min) {
    return " Can't Be Less Than $min";
  }
  if (val.length > max) {
    return " Can't Be Larger Than $max";
  }
}
