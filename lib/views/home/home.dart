import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/components/nav_bar/view/nav_bar.dart';
import 'package:flutter_getx/controllers/home/home_controller.dart';
import 'package:flutter_getx/services/apis/house/index_house/index_house.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final indexHouseApi = Get.find<IndexHouseApi>();

    void _onPressed() {
      homeController.increment();
      Get.snackbar(
          'Hello',
          'This is a message',
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
      );
    }

    void _logOut() {
      final box = GetStorage();

      box.remove('access_token');
      box.remove('refresh_token');

      // TODO: logout not working yet
      Get.offAllNamed('get_started');
    }

    void _indexHouse() {
      indexHouseApi.index();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                () => Text(
                  "${homeController.count}",
                  style: TextStyle(fontSize: 30),
                )
            ),
            CupertinoButton(
              onPressed: () => _indexHouse(),
              child: Text("Go to detail"),
              color: Colors.purple,
              // textColor: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
              onPressed: _logOut,
              child: Text('Log Out'),
              color: Colors.red,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onPressed(),
        // onPressed: () => homeController.increment(),
        child: Icon(Icons.add),
        isExtended: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: NavBar(),
    );
  }
}

