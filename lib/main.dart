import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx/bindings/detail/detail_binding.dart';
import 'package:flutter_getx/views/detail/detail.dart';
import 'package:flutter_getx/bindings/get_started/get_started_binding.dart';
import 'package:flutter_getx/views/get_started/get_started.dart';
import 'package:flutter_getx/bindings/home/home_binding.dart';
import 'package:flutter_getx/views/home/home.dart';
import 'package:flutter_getx/controllers/global_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple,
    ));
    final box = GetStorage();
    GlobalController globalController = Get.put(GlobalController());
    globalController.setAccessToken(box.read('access_token'));
    globalController.setRefreshToken(box.read('refresh_token'));
    globalController.setLoginStatus([null, ''].contains(globalController.accessToken.value) ? false : true);


    return GetMaterialApp(
      title: 'Flutter Getx Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      getPages: [
        GetPage(name: "/get_started", page: () => GetStarted(), binding: GetStartedBinding()),
        GetPage(name: "/home", page: () => Home(), binding: HomeBinding()),
        GetPage(name: "/detail", page: () => Detail(), binding: DetailBinding()),
      ],
      initialRoute: globalController.loginStatus.value ? 'home' : 'get_started',
      debugShowCheckedModeBanner: false,
    );
  }
}
