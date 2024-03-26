import 'package:barbershop/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Nobre",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: XTheme.themeData(),
      builder: (context, child) {
        return MediaQuery(
          // ignore: sort_child_properties_last
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: .9),
        );
      },
    ),
  );
}
