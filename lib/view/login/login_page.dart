import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
class LoginPage extends StatelessWidget{
    LoginPage({super.key});

   final LoginController _controller = Get.put(LoginController());
   final _formKey = GlobalKey<FormState>();

   @override
   Widget build(BuildContext context) {
     _controller.dom.value=Get.arguments;
     return Scaffold(
       appBar: AppBar(title: Text("Login"),),
       body: SingleChildScrollView(
         child:
         Form(
           key: _formKey,
           child: Column(
             children: <Widget>[

               Padding(

                 padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 25,),
                 child:
                 TextFormField(
                   controller: _controller.emailTextController,
                   keyboardType: TextInputType.emailAddress,
                   decoration: InputDecoration(
                     fillColor: Colors.grey[200],
                     filled: true,
                     hintText: 'userName',
                     hintStyle: TextStyle(
                       fontSize: 16,
                       color: Colors.grey,
                       fontWeight: FontWeight.normal,
                     ),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(
                         color: Colors.transparent,
                         width: 0,
                       ),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(
                         color: Colors.transparent,
                         width: 0,
                       ),
                     ),
                   ),
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.black,
                     fontWeight: FontWeight.normal,
                   ),
                   validator: (value) =>
                   value.toString().trim().isEmpty ? 'Email required' : null,
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(
                     left: 15.0, right: 15.0, top: 15, bottom: 0),
                 //padding: EdgeInsets.symmetric(horizontal: 15),
                 child:
                 TextFormField(
                   controller: _controller.passwordTextController,
                   keyboardType: TextInputType.text,
                   obscureText: true,
                   decoration: InputDecoration(
                     fillColor: Colors.grey[200],
                     filled: true,
                     hintText: 'Password',
                     hintStyle: TextStyle(
                       fontSize: 16,
                       color: Colors.grey,
                       fontWeight: FontWeight.normal,
                     ),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(
                         color: Colors.transparent,
                         width: 0,
                       ),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(
                         color: Colors.transparent,
                         width: 0,
                       ),
                     ),
                   ),
                   validator: (value) =>
                   value.toString().trim().isEmpty ? 'Password required' : null,
                   style: TextStyle(
                     fontSize: 16,
                     color: Colors.black,
                     fontWeight: FontWeight.normal,
                   ),
                 ),
               ),



               Container(
                 margin: EdgeInsets.only(top: 25),
                 height: 50,
                 width: 250,
                 decoration: BoxDecoration(
                     color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                 child: TextButton(
                   onPressed: () {
                     if (_formKey.currentState!.validate()) {
                       _controller.apiCreateAccount();
                     }

                   },
                   child: Text(
                     'Login',
                     style: TextStyle(color: Colors.white, fontSize: 25),
                   ),
                 ),
               ),

        
             ],
           ),
         ),
       ),

     );
   }
}