import 'package:excelerate_learning_app/app/bindings/initial_bindings.dart';
import 'package:excelerate_learning_app/app/constants/app_constants.dart';
import 'package:excelerate_learning_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies(); // Initial GetX controllers
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
    );
  }
}

