import 'package:flutter/material.dart';
import 'package:flutter_getx/components/nav_bar/view/nav_bar.dart';
import 'package:flutter_getx/controllers/home/home_controller.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                () => Text(
                  "The count is ${homeController.count}"
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
