import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/get_started/controller/get_started_controller.dart';
import 'package:flutter_getx/services/apis/auth/get_started/get_started.dart';
import 'package:get/get.dart' hide Response;
import 'package:flutter_getx/utils/toast/toast.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final gsc = Get.find<GetStartedController>();
    final gss = Get.find<GetStartedApi>();

    _getStarted() async {
      gsc.changeLoadingStatus();

      var response = await gss.lookUp(
        countryCode: gsc.countryCode.value,
        phone: gsc.phone.value
      );

      gsc.changeLoadingStatus();

      if (response != null) {
        gsc.changeVerifiedStatus(response.verified);
      }
    }

    return CupertinoPageScaffold(
      backgroundColor: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Expanded(
              child: Image.asset('assets/images/logo.png'),
            )
          ),
          Container(
            child: CupertinoTextField(
              placeholder: 'Phone number',
              controller: phoneController,
              onChanged: (phone) => gsc.changePhone(phone),
              prefix: Icon(Icons.phone),
            ),
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
          ),
          Obx(
            () => Visibility(
              child: Container(
                child: CupertinoTextField(
                  placeholder: 'Password',
                  controller: passwordController,
                  onChanged: (password) => Toast.toast(password),
                  obscureText: true,
                  prefix: Icon(Icons.lock),
                ),
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 20),
              ),
              visible: gsc.verified.value == 2,
            )
          ),
          Obx(
            () => Container(
              child: CupertinoButton(
                child: Text(gsc.verified.value == 0 ? 'GET STARTED' : gsc.verified.value == 1 ? 'REGISTER' : 'LOGIN'),
                color: Colors.red,
                onPressed: _getStarted,
              ),
            )
          ),
          Obx(
            () => Visibility(
              child: Container(
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 50,
                ),
                padding: EdgeInsets.all(30),
              ),
              visible: gsc.loading.value,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
            )
          ),
        ],
      )
    );
  }
}
