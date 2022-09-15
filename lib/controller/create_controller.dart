import 'package:get/get.dart';

import '../model/create_dto.dart';
import '../model/doamain_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../network/config.dart';
import '../view/login/login_page.dart';
class CreateAccountController extends GetxController{

  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  var createAccountResponse=CreateDTO().obs;
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
      final response = await Dio().post(Config.BASE_URL+"accounts",data: {
          "address": emailTextController.text+"@"+dom.value,
          "password": passwordTextController.text
          }, options: Options(headers: headers));

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("object Success");
        Get.back();
        Get.off(() => LoginPage());
        print(response);
        createAccountResponse.value=CreateDTO.fromJson(response.data);


      } else {
        print('${response.statusCode} : ${response.data.toString()}');

      }
    } catch (e) {
      e as DioError;
      print(e);
    }
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}