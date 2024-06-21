import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/core/mymiddleware/middleware.dart';
import 'package:admin_fujika_ecommerce/view/language.dart';
import 'package:admin_fujika_ecommerce/view/screen/Auth/login.dart';
import 'package:admin_fujika_ecommerce/view/screen/Auth/successsignUp.dart';
import 'package:admin_fujika_ecommerce/view/screen/Auth/users.dart';
import 'package:admin_fujika_ecommerce/view/screen/Auth/verifypassword.dart';
import 'package:admin_fujika_ecommerce/view/screen/Auth/verifysignupcode.dart';
import 'package:admin_fujika_ecommerce/view/screen/categories/add.dart';
import 'package:admin_fujika_ecommerce/view/screen/categories/edit.dart';
import 'package:admin_fujika_ecommerce/view/screen/categories/view.dart';
import 'package:admin_fujika_ecommerce/view/screen/forgetpass/forgetpassword.dart';
import 'package:admin_fujika_ecommerce/view/screen/forgetpass/resetpassword.dart';
import 'package:admin_fujika_ecommerce/view/screen/forgetpass/successresetpass.dart';
import 'package:admin_fujika_ecommerce/view/screen/home.dart';
import 'package:admin_fujika_ecommerce/view/screen/items/add.dart';
import 'package:admin_fujika_ecommerce/view/screen/items/edit.dart';
import 'package:admin_fujika_ecommerce/view/screen/items/view.dart';
import 'package:admin_fujika_ecommerce/view/screen/orders/details.dart';
import 'package:admin_fujika_ecommerce/view/screen/orders/screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),

  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.verfiyCodelogin, page: () => const VerifySignUp()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.users, page: () => const Users()),
  GetPage(
      name: AppRoute.successloginpassword, page: () => const SuccessSignUp()),

  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPass()),

  //Categories
  GetPage(name: AppRoute.categoryview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoryadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoryedit, page: () => const CategoriesEdit()),

  //Items
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),

  //Orders
  GetPage(name: AppRoute.orderhome, page: () => const OrderScreen()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),

  //Home
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
];
