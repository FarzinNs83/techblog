// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog_app/component/constant/api_const.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/component/constant/storage_const.dart';
import 'package:techblog_app/services/dio_service.dart';
import 'package:techblog_app/view/main_screen/main_screen.dart';
import 'package:techblog_app/view/register_intro.dart';

class RegisterIntroController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activationCodeTextEditingController =
      TextEditingController();
  var email = '';
  var userId = '';
  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response = await DioService().postMethod(map, ApiConst.postRegister);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(response.toString());
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activationCodeTextEditingController.text,
      'command': 'verify',
    };
    var response = await DioService().postMethod(map, ApiConst.postRegister);
    debugPrint(response.toString());
    var status = response.data['response'];
    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StoreKey.token, response.data['token']);
        box.write(StoreKey.userId, response.data['user_id']);

        debugPrint("Read::: " + box.read(StoreKey.token));
        debugPrint("Read::: " + box.read(StoreKey.userId));

        Get.to(MainScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعالسازی غلط است');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعالسازی منقضی شده است');
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(StoreKey.token) == null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }
}
