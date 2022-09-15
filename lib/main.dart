import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rise_up_lab/page/login/login_page.dart';
import 'package:rise_up_lab/page/search/search_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rise up Demo',

      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home:  SearchPage(),

      getPages: [
        GetPage(name: '/', page: () =>  SearchPage()),
        // GetPage(name: '/second', page: () => Second()),
        // GetPage(name: '/third', page: () => Third()),
        // GetPage(name: "/fourth", page: () => Fourth()),
      ],
    );
  }
}


