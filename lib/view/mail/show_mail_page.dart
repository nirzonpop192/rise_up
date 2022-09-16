import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMailPage extends StatelessWidget {
   ShowMailPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    dynamic argumentData = Get.arguments;
    return
      Scaffold(
        appBar: AppBar(title: Text("Mail"),),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Text("${argumentData[1]['from']}",), // second element set here
          Text("${argumentData[0]['body']}"), // first element set here
        ],
    ),
      );
  }
}
