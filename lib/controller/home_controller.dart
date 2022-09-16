import 'package:get/get.dart';

import 'package:dio/dio.dart';
import '../model/message_dto.dart';
import '../configuration/config.dart';
class HomeController extends GetxController{

  var _response=MessageDTO().obs;
  var mailList=<HydraMember>[].obs;
  // var token="".obs;
   //final LoginController _controller = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
    fetchMessage();
  }

  void fetchMessage() async{

    Map<String,dynamic> headers = {};
    headers["accept"] = "application/ld+json";
    headers["Authorization"] = "Bearer ${Config.TOKEN}".trim();

    try {
      final response = await Dio().get(Config.BASE_URL+"messages", options: Options(headers: headers));

      if (response.statusCode == 200) {
        print(response);

         _response.value=MessageDTO.fromJson(response.data);
          mailList.value=_response.value.hydraMember!;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');

      }
    } catch (e) {
      e as DioError;
      print(e);
    }
  }
}