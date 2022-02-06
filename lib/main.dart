import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  // GestureBinding.instance!.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
    GetMaterialApp(
      title: "Application",
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
    ),
  );
}
