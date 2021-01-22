import 'package:flutter/material.dart';
import 'package:flutter_getx/components/nav_bar/controller/nav_bar_controller.dart';
import 'package:flutter_getx/pages/home/view/home.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavBarController c = Get.put(NavBarController());

    void _onChange(int index) {
      c.setPos(index);
      switch (index) {
        case 1:
          // Get.toNamed('/detail');
          Get.toNamed('/detail');
          break;
        case 0:
        default:
          Get.offAll(Home());
          break;
      }
    }

    return Obx(
        () => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.details),
                label: 'Detail'
            )
          ],
          selectedItemColor: Colors.deepPurple,
          currentIndex: c.pos.toInt(),
          onTap: _onChange,
          // onTap: (index) => c.setPos(index),
          unselectedItemColor: Colors.white,
        )
    );
  }
}
