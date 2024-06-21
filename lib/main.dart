import 'package:admin_fujika_ecommerce/Binding/intialbinding.dart';
import 'package:admin_fujika_ecommerce/core/localization/changelocal.dart';
import 'package:admin_fujika_ecommerce/core/localization/translation.dart';
import 'package:admin_fujika_ecommerce/core/services/services.dart';
import 'package:admin_fujika_ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(() => MyServices().init());
  WidgetsFlutterBinding.ensureInitialized();
  await initialsrvices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Fujika Ecommerce',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
