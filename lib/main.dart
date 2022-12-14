import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import './view/mail/show_mail_page.dart';
import './view/home/home_page.dart';
import './view/create/create_account_page.dart';
import './view/login/login_page.dart';
import './view/search/search_page.dart';



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
         GetPage(name: '/login', page: () => LoginPage()),
         GetPage(name: '/create', page: () => CreateAccountPage()),
         GetPage(name: "/home", page: () => HomePage()),
         GetPage(name: "/mail", page: () => ShowMailPage()),
      ],
    );
  }
}


