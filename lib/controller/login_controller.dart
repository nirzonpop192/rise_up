import 'package:get/get.dart';
import 'package:rise_up_lab/view/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/login_dto.dart';
import '../configuration/config.dart';


class LoginController extends GetxController{

  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  var loginResponse=LoginDTO().obs;
  var dom="".obs;
  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();

  }

  void apiCreateAccount() async{

    Map<String,dynamic> headers = {};
    headers["accept"] = "application/ld+json";
    headers["Content-Type"] = "application/ld+json";

    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    try {

      final response = await Dio().post(Config.BASE_URL+"token",data: {
        "address": emailTextController.text+"@"+dom.value,
        "password": passwordTextController.text
      }, options: Options(headers: headers));

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        loginResponse.value=LoginDTO.fromJson(response.data);
        Config.TOKEN=loginResponse.value.token!;
        print("object Success");

        Get.off(() => HomePage());
        print(response);

      } else {
        Get.back();
        print('${response.statusCode} : ${response.data.toString()}');
        Get.snackbar("Error", "Invalid User Name or password");

      }
    } catch (e) {
     // e as DioError;
      print(e);
      Get.back();
    }
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}