import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/pages/get_started/controller/get_started_controller.dart';
import 'package:flutter_getx/services/apis/auth/get_started/get_started.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    final gsc = Get.find<GetStartedController>();
    final gss = Get.find<GetStartedService>();

    final logger = Logger();

    _getStarted() {
      var response = gss.lookUp(gsc.countryCode.value, gsc.phone.value);
      logger.d(response);
    }

    return CupertinoPageScaffold(
      backgroundColor: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: CupertinoTextField(
              controller: phoneController,
              onChanged: (phone) => gsc.changePhone(phone),
              prefix: Icon(Icons.phone),
            ),
            padding: EdgeInsets.all(50),
          ),
          Container(
            child: CupertinoButton(
              child: Text('GET STARTED'),
              color: Colors.red,
              onPressed: _getStarted,
            ),
          )
        ],
      )
    );
  }
}
