import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../mail/show_mail_page.dart';
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

   final homeController=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Domain Name"),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child:
            GetX<HomeController>(

                builder: (controller) {
                  return ListView.builder(
                       itemCount: controller.mailList.length,

                      itemBuilder: (context,index){


                        return InkWell(
                                  onTap: (){

                                    Get.to(() => ShowMailPage(), arguments: [
                                      {"body": controller.mailList![index].intro},
                                      {"from": controller.mailList![index].from?.address.toString()}
                                    ]);
                                },
                                  child:  Card(
                                    child:  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("From ${controller.mailList![index].from?.address.toString()}",style: TextStyle(fontSize: 14),),
                                        Text("Subject ${controller.mailList![index].subject}",style: TextStyle(fontSize: 10),),
                                        Text(" ${controller.mailList![index].intro}",style: TextStyle(fontSize: 10),),

                                      ],
                                    ),
                                  ));

                         ;

                      });
                }
            ))
          ],
        ),
      ),
    );
  }
}
