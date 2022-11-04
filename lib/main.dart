

import 'package:flutter/material.dart';
import 'package:aqua/webview/index.dart';


String? email ;
String? pass ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Home',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => index(),
      //'/login': (context) => login(),
     // '/register': (context) => RegisterPage(),
    },
  ));
}




