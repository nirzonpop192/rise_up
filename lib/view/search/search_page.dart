import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/search_controller.dart';
class SearchPage extends StatelessWidget{
   SearchPage({super.key});

  final searchController=Get.put(SearchController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Search Domain Name"),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: 
            GetX<SearchController>(

              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.domainNames.length,
                    itemBuilder: (context,index){


                  return  Card(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.domainNames[index].domain.toString(),style: TextStyle(fontSize: 20),),
                        ElevatedButton(onPressed: (){
                          Get.toNamed('/create',
                          arguments: controller.domainNames[index].domain.toString());
                        }, child: Text("Create Account"))
                      ],
                    ),
                  );

                });
              }
            ))
          ],
        ),
      ),
    );
  }
}