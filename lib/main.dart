import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/detail/binding/detail_binding.dart';
import 'package:flutter_getx/pages/detail/view/detail.dart';
import 'package:flutter_getx/pages/get_started/binding/get_started_binding.dart';
import 'package:flutter_getx/pages/get_started/controller/log_in_controller.dart';
import 'package:flutter_getx/pages/get_started/view/get_started.dart';
import 'package:flutter_getx/pages/home/binding/home_binding.dart';
import 'package:flutter_getx/pages/home/view/home.dart';
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
    final box = GetStorage();
    LoginController loginController = Get.put(LoginController());
    loginController.setAccessToken(box.read('access_token'));
    loginController.setRefreshToken(box.read('refresh_token'));
    loginController.setLoggedInStatus([null, ''].contains(loginController.accessToken.value) ? false : true);

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
      initialRoute: ["", null, false, 0].contains(box.read('access_token')) ? '/get_started' : '/home',
      debugShowCheckedModeBanner: false,
    );
  }
}
