import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/get_started/get_started_controller.dart';
import 'package:flutter_getx/controllers/global_controller.dart';
import 'package:flutter_getx/services/apis/auth/get_started/get_started.dart';
import 'package:flutter_getx/services/apis/auth/login/login.dart';
import 'package:flutter_getx/services/apis/auth/register/register.dart';
import 'package:get/get.dart' hide Response;

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final gsc = Get.find<GetStartedController>();
    final lgc = Get.find<GlobalController>();
    final gss = Get.find<GetStartedApi>();
    final rs = Get.find<RegisterApi>();
    final lg = Get.find<LoginApi>();

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

    _register() async {
      gsc.changeLoadingStatus();

      var response = await rs.register(
        countryCode: gsc.countryCode.value,
        phone: gsc.phone.value
      );

      gsc.changeLoadingStatus();

      if (response != null) {
        gsc.changeVerifiedStatus(true);
      }
    }

    _login() async {
      gsc.changeLoadingStatus();

      var response = await lg.login(
        phone: gsc.countryCode.value + gsc.phone.value,
        password: gsc.password.value
      );

      gsc.changeLoadingStatus();

      if (response != null) {
        lgc.setAccessToken(response.access_token);
        lgc.setRefreshToken(response.refresh_token);
        lgc.setLoginStatus(true);
      }

      Get.offNamed('home');
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
            child: SizedBox(
              child: CupertinoTextField(
                placeholder: 'Phone number',
                controller: phoneController,
                onChanged: (phone) => gsc.changePhone(phone),
                prefix: Container(
                  child: Icon(Icons.phone),
                  padding: EdgeInsets.only(left: 10),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              height: 40,
            ),
            padding: EdgeInsets.only(left: 50, right: 50),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Visibility(
              child: Container(
                child: SizedBox(
                  child: CupertinoTextField(
                    placeholder: 'Password',
                    controller: passwordController,
                    onChanged: (password) => gsc.changePassword(password),
                    obscureText: true,
                    prefix: Container(
                      child: Icon(Icons.lock),
                      padding: EdgeInsets.only(left: 10),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 25
                    ),
                  ),
                  height: 40,
                ),
                padding: EdgeInsets.only(left: 50, right: 50),
              ),
              visible: gsc.verified.value == 2,
            )
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Container(
              child: CupertinoButton(
                child: Text(gsc.verified.value == 0 ? 'GET STARTED' : gsc.verified.value == 1 ? 'REGISTER' : 'LOGIN'),
                color: Colors.red,
                onPressed: gsc.verified.value == 0 ? _getStarted : gsc.verified.value == 1 ? _register : _login,
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
