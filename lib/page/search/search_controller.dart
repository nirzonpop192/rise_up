import 'package:get/get.dart';

import '../../dto/doamain_dto.dart';
import 'package:dio/dio.dart';

import '../../network/config.dart';
class SearchController extends GetxController{

  var _domain=DomainDTO().obs;
  var domainNames=<HydraMember>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDomainNames();
  }

  void fetchDomainNames() async{

    Map<String,dynamic> headers = {};
    headers["accept"] = "application/ld+json";
    headers["Content-Type"] = "application/ld+json";


    try {
      final response = await Dio().get(Config.BASE_URL+"domains/", options: Options(headers: headers));

      if (response.statusCode == 200) {
        print(response);
         DomainDTO.fromJson(response.data);
        _domain.value=DomainDTO.fromJson(response.data);
        domainNames.value=_domain.value.hydraMember!;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');

      }
    } catch (e) {
      e as DioError;
      print(e);
    }
  }
}