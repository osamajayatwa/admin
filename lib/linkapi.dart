class AppLink {
  //static const String server = "http://192.168.1.73:802/ecommerce/admins"; //lap

  static const String server =
      "http://192.168.96.127:802/ecommerce/admins"; //phone

  // static const String server = "http://192.168.68.117:802/ecommerce/admins";//shehab

  // static const String server ="http://10.0.2.2:802/ecommerce/admins";//emulater phone

  // static const String server =   "http://:802/ecommerce/admins";//emulater lap

  // static const String imageststatic =
  //     "http://192.168.1.73:802/ecommerce/upload";

  static const String imageststatic =
      "http://192.168.96.127:802/ecommerce/upload";
//

  static const String notification = "$server/notification.php";

//========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
// =============================================================

// ================================= Auth ========================== //

  static const String logindata = "$server/auth/login.php";
  static const String users = "$server/auth/users.php";
  static const String verifysignupdata = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetpass = "$server/forgetpassword/resetpassword.php";
  static const String forgetverifycode =
      "$server/forgetpassword/verifycode.php";

// Home
  static const String homepage = "$server/home.php";

//Categories
  static const String categoryadd = "$server/categories/add.php";
  static const String categoryedit = "$server/categories/edit.php";
  static const String categoryview = "$server/categories/view.php";
  static const String categorydelete = "$server/categories/delete.php";

//items
  static const String itemsview = "$server/items/view.php";
  static const String itemsadd = "$server/items/add.php";
  static const String itemsedit = "$server/items/edit.php";
  static const String itemsdelete = "$server/items/delete.php";

//Orders
  static const String acceptedorders = "$server/orders/viewaccepted.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersprepare = "$server/orders/prepare.php";
  static const String ordersapprove = "$server/orders/approve.php";
  static const String ordersview = "$server/orders/viewpending.php";
  static const String ordersdetails = "$server/orders/details.php";

  static const String test = "$server/test.php";
}
